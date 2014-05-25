TARGETDIR=$1
# Set root password to 'root'. Password generated with
# mkpasswd, from the 'whois' package in Debian/Ubuntu.
sed -i 's%^root::%root:8kfIfYHmcyQEE:%' $TARGETDIR/etc/shadow

# Add task to mount everything
mkdir $TARGETDIR/etc/init/
cp board/raspberrypi/mount.conf $TARGETDIR/etc/init/

# Add task to set hostname
cp board/raspberrypi/hostname.conf $TARGETDIR/etc/init/

# Add eth0 dhcp entry into /etc/network/interfaces
cp board/raspberrypi/interfaces $TARGETDIR/etc/network/

# Enable NetworkManager service
ln -sf '/usr/lib/systemd/system/NetworkManager.service' $TARGETDIR/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
ln -sf '/usr/lib/systemd/system/NetworkManager.service' $TARGETDIR/etc/systemd/system/multi-user.target.wants/NetworkManager.service
ln -sf '/usr/lib/systemd/system/NetworkManager-dispatcher.service' $TARGETDIR/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service

cp board/raspberrypi/config.txt $BINARIES_DIR/rpi-firmware/
cp board/raspberrypi/cmdline.txt $BINARIES_DIR/rpi-firmware/
