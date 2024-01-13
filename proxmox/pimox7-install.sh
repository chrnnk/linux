#!
# https://github.com/pimox/pimox7
# Flash and startup the latest image from https://downloads.raspberrypi.org/raspios_arm64/
sudo -s
curl https://raw.githubusercontent.com/pimox/pimox7/master/RPiOS64-IA-Install.sh > RPiOS64-IA-Install.sh
chmod +x RPiOS64-IA-Install.sh
./RPiOS64-IA-Install.sh

# disable wifi/bluetooth