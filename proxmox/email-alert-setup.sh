# install dependencies:
apt install -y libsasl2-modules mailutils postfix-pcre

# configure app passwords on your Google account:
# https://myaccount.google.com/apppasswords

# configure postfix
echo "smtp.gmail.com your-email@gmail.com:YOURAPPPASSWORD" > /etc/postfix/sasl_passwd
# update permissions
chmod 600 /etc/postfix/sasl_passwd
# hash the file
postmap hash:/etc/postfix/sasl_passwd
# check to to be sure the db file was create
cat /etc/postfix/sasl_passwd.db

# edit postfix config
nano /etc/postfix/main.cf
# google mail configuration
relayhost = smtp.gmail.com:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_security_options =
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/Entrust_Root_Certification_Authority.pem
smtp_tls_session_cache_database = btree:/var/lib/postfix/smtp_tls_session_cache
smtp_tls_session_cache_timeout = 3600s
smtp_header_checks = pcre:/etc/postfix/smtp_header_checks

# edit snmp header config to change sender name
nano /etc/postfix/smtp_header_checks
# add the following text
/^From:.*/ REPLACE From: arm-pve-alerts doesnt@matter.com
# hash the file
postmap hash:/etc/postfix/smtp_header_checks
# check the contents of the file
cat /etc/postfix/smtp_header_checks.db

# reload postfix
postfix reload
# send a test emails
echo "This is a test message sent from postfix on my Proxmox Server" | mail -s "Test Email from Proxmox" your-email@gmail.com

# in proxmox gui, add email address to backup jobs and set the root user's email address to your alert email address