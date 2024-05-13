#!/bin/bash


wget -N https://downloads.redpitaya.com/downloads/LinuxOS/red_pitaya_OS-beta_1.08.img.zip
unzip -n red_pitaya_OS-beta_1.08.img.zip
rm -f redpitaya.img
mv *.img redpitaya.img


mkdir -p boot root
LOOP_DEV=$(sudo losetup -fP --show 'redpitaya.img')
echo "$LOOP_DEV"
echo "mount img"
sudo mount -o rw "$LOOP_DEV"p1 boot
sudo mount -o rw "$LOOP_DEV"p2 root

sleep 3
echo "copy qemu"
sudo cp "/usr/bin/qemu-arm-static" "root/usr/bin/"

sudo mount -t proc proc "${PWD}/root/proc/"
sudo mount -t sysfs sys "${PWD}/root/sys/"
sudo mount -o bind /dev/ "${PWD}/root/dev/"
sudo mount -o bind /dev/pts "${PWD}/root/dev/pts"
sudo mount -o bind /run "${PWD}/root/run"

sleep 3
echo "run chroot root"
cat << EOF | sudo chroot root

export LANG='C' LC_ALL='C' LANGUAGE='C'
export DEBIAN_FRONTEND=noninteractive

# Lock services
echo 'exit 101' > '/usr/sbin/policy-rc.d'
chmod +x '/usr/sbin/policy-rc.d'

# you can install missing tools
#sudo apt-get install -y sshpass
apt update -y
#apt -yq install apt-utils
#apt -yq install memtester
#apt full-upgrade -y
#apt clean -y
apt -y install wireless-tools
# Unlock services
rm '/usr/sbin/policy-rc.d'

add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get -y install gcc-9 g++-9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9

echo 1.08 > /root/.version

exit

EOF


sleep 5

sudo umount "${PWD}/root/run/"
sudo umount "${PWD}/root/dev/pts"
sudo umount "${PWD}/root/dev/"
sudo umount "${PWD}/root/sys/"
sudo umount "${PWD}/root/proc/"

sleep 1

echo "remove qemu"
sudo rm "root/usr/bin/qemu-arm-static"

sudo rm -rf ./boot/*
echo "PRESS ANY KEY"
read
echo "DONE"

sleep 3
echo "run chroot root"
cat << EOF | sudo chroot root

export LANG='C' LC_ALL='C' LANGUAGE='C'
export DEBIAN_FRONTEND=noninteractive

# Lock services
echo 'exit 101' > '/usr/sbin/policy-rc.d'
chmod +x '/usr/sbin/policy-rc.d'

systemctl enable netstart.service
systemctl disable wpa_supplicant@wlan0.service
rm -f /etc/systemd/system/wpa_supplicant@.service

# Unlock services
rm '/usr/sbin/policy-rc.d'

exit

EOF


sleep 5


sudo dd if=/dev/zero of=boot/zero.bin bs=1MiB
sudo dd if=/dev/zero of=root/zero.bin bs=1MiB
sync
sudo rm ./boot/zero.bin ./root/zero.bin
sync


echo "umount img"
sleep 1
sudo umount  ./boot
sudo rm -rf  ./boot
sleep 1
sudo umount  ./root
sudo rm -rf  ./root
sleep 1
sudo losetup -d "$LOOP_DEV"

sleep 2

echo "ALL DONE"
