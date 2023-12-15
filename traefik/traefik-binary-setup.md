get the latest binary file
    go to https://github.com/containous/traefik/releases and download the latest binary.
    extract the binary tar -zxvf traefik_${traefik_version}_linux_${arch}.tar.gz
    check the binary works ./traefik --help
    if you can't execute the file, run chmod +x traefik
copy traefik to /usr/local/bin

sudo cp /path/to/traefik /usr/local/bin
sudo chown root:root /usr/local/bin/traefik
sudo chmod 755 /usr/local/bin/traefik

give the traefik binary the ability to bind to privileged ports (80, 443) as non-root

sudo setcap 'cap_net_bind_service=+ep' /usr/local/bin/traefik

setup traefik user and group and permissions

sudo groupadd -g 321 traefik
sudo useradd \
  -g traefik --no-user-group \
  --home-dir /var/www --no-create-home \
  --shell /usr/sbin/nologin \
  --system --uid 321 traefik
sudo usermod -aG docker traefik

sudo mkdir /etc/traefik
sudo mkdir /etc/traefik/acme
sudo mkdir /etc/traefik/dynamic
sudo chown -R root:root /etc/traefik
sudo chown -R traefik:traefik /etc/traefik/dynamic

sudo touch /var/log/traefik.log
sudo chown traefik:traefik /var/log/traefik.log

add traefik config files

create the following files, replace 'bendog' and 'bendog.org' with your project name and project base url

create the file /etc/traefik/traefik.toml with the following content
```
################################################################
#
# Configuration sample for Traefik v2.
#
# For Traefik v1: https://github.com/containous/traefik/blob/v1.7/traefik.sample.toml
#
################################################################

################################################################
# Global configuration
################################################################
[global]
  checkNewVersion = true
  sendAnonymousUsage = true

################################################################
# Entrypoints configuration
################################################################

# Entrypoints definition
#
# Optional
# Default:
[entryPoints]
  [entryPoints.web]
    address = ":80"

  [entryPoints.websecure]
    address = ":443"

[certificatesResolvers.bendog.acme]
  email = "ben@bendog.org"
  storage = "/etc/traefik/acme/bendog.json"
  [certificatesResolvers.bendog.acme.httpChallenge]
    # used during the challenge
    entryPoint = "web"

################################################################
# Traefik logs configuration
################################################################

# Traefik logs
# Enabled by default and log to stdout
#
# Optional
#
[log]

  # Log level
  #
  # Optional
  # Default: "ERROR"
  #
  level = "DEBUG"

  # Sets the filepath for the traefik log. If not specified, stdout will be used.
  # Intermediate directories are created if necessary.
  #
  # Optional
  # Default: os.Stdout
  #
  filePath = "/var/log/traefik.log"

  # Format is either "json" or "common".
  #
  # Optional
  # Default: "common"
  #
  # format = "json"

################################################################
# Access logs configuration
################################################################

# Enable access logs
# By default it will write to stdout and produce logs in the textual
# Common Log Format (CLF), extended with additional fields.
#
# Optional
#
# [accessLog]

  # Sets the file path for the access log. If not specified, stdout will be used.
  # Intermediate directories are created if necessary.
  #
  # Optional
  # Default: os.Stdout
  #
  # filePath = "/path/to/log/log.txt"

  # Format is either "json" or "common".
  #
  # Optional
  # Default: "common"
  #
  # format = "json"

################################################################
# API and dashboard configuration
################################################################

# Enable API and dashboard
[api]

  # Enable the API in insecure mode
  #
  # Optional
  # Default: true
  #
  # insecure = false

  # Enabled Dashboard
  #
  # Optional
  # Default: true
  #
  # dashboard = false

################################################################
# Ping configuration
################################################################

# Enable ping
[ping]

  # Name of the related entry point
  #
  # Optional
  # Default: "traefik"
  #
  # entryPoint = "traefik"

################################################################
# Docker configuration backend
################################################################

# Enable Docker configuration backend
[providers.docker]

  # Docker server endpoint. Can be a tcp or a unix socket endpoint.
  #
  # Required
  # Default: "unix:///var/run/docker.sock"
  #
  endpoint = "unix:///var/run/docker.sock"

  # Default host rule.
  #
  # Optional
  # Default: "Host(`{{ normalize .Name }}`)"
  #
  # defaultRule = "Host(`{{ normalize .Name }}.docker.localhost`)"
  defaultRule = "Host(`{{ normalize .Name }}.bendog.org`)"

  # Expose containers by default in traefik
  #
  # Optional
  # Default: true
  #
  exposedByDefault = false

################################################################
# Docker configuration backend
################################################################
[providers.file]
  directory = "/etc/traefik/dynamic/"
```

setup the global http -> https redirect

create the file /etc/traefik/dynamic/redirect.toml with the following content
```

## dynamic configuration

[http.routers]
  [http.routers.redirecttohttps]
    entryPoints = ["web"]
    middlewares = ["httpsredirect"]
    rule = "HostRegexp(`{host:.+}`)"
    service = "noop"

[http.services]
  # noop service, the URL will be never called
  [http.services.noop.loadBalancer]
    [[http.services.noop.loadBalancer.servers]]
      url = "http://127.0.0.1"

[http.middlewares]
  [http.middlewares.httpsredirect.redirectScheme]
    scheme = "https"
```

setup and start the systemd service

create the file /etc/systemd/system/traefik.service with the following content
```
[Unit]
Description=traefik proxy
After=network-online.target
Wants=network-online.target systemd-networkd-wait-online.service

[Service]
Restart=on-abnormal
; User and group the process will run as.
User=traefik
Group=traefik
; Always set "-root" to something safe in case it gets forgotten in the traefikfile.
ExecStart=/usr/local/bin/traefik --configfile=/etc/traefik/traefik.toml
; Limit the number of file descriptors; see `man systemd.exec` for more limit settings.
LimitNOFILE=1048576
; Use private /tmp and /var/tmp, which are discarded after traefik stops.
PrivateTmp=true
; Use a minimal /dev (May bring additional security if switched to 'true', but it may not work on Raspberry Pi's or other devices, so it has been disabled in this dist.)
PrivateDevices=false
; Hide /home, /root, and /run/user. Nobody will steal your SSH-keys.
ProtectHome=true
; Make /usr, /boot, /etc and possibly some more folders read-only.
ProtectSystem=full
; … except /etc/ssl/traefik, because we want Letsencrypt-certificates there.
;   This merely retains r/w access rights, it does not add any new. Must still be writable on the host!
ReadWriteDirectories=/etc/traefik/acme
; The following additional security directives only work with systemd v229 or later.
; They further restrict privileges that can be gained by traefik. Uncomment if you like.
; Note that you may have to add capabilities required by any plugins in use.
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
```

then run the following commands

sudo chown root:root /etc/systemd/system/traefik.service
sudo chmod 644 /etc/systemd/system/traefik.service
sudo systemctl daemon-reload
sudo systemctl start traefik.service

if it doens't work correctly, use this command to investigate why

journalctl --boot -u traefik.service

to enable autoboot use this command

sudo systemctl enable traefik.service

testing the service with whoami

create the following docker-compose file, replacing 'bendog' and 'bendog.org' with the values you specified in your traefik.toml file.

create the file ~/docker/whoami/docker-compose.yml with the following content
```
version: '3'

services:
  whoami:
    # A container that exposes an API to show its IP address
    image: containous/whoami
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.whoami.rule=Host(`whoami.bendog.org`)"
      - "traefik.http.routers.whoami.tls=true"
      - "traefik.http.routers.whoami.tls.certresolver=bendog"
```


then start the docker image

sudo docker-compose up -d