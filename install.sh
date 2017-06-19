#!/system/bin/sh
clear
echo "
------------------------------------------"
sleep 0.6
echo "           AndroBox - v1.0.0"
sleep 0.8
echo "          Created By  ./Xi4u7"
sleep 0.8
echo "------------------------------------------\n\n"

echo "[+] Mounting System ..."
mount -o remount,rw /;
mount -o remount,rw /data;
mount -o remount,rw /system;
echo "[+] Preparing Iso Files ..."
busybox mv AndroBox.iso /data/local/
echo "[+] Extracing AndroBox Packages ..."
cd /
cd /data/local/
rename AndroBox.iso AndroBox.tar.gz
busybox tar -xzf AndroBox.tar.gz
echo "[+] Generating Binary Files ..."
echo "#!/system/bin/sh
./data/local/AndroBox/bin/AndroBox
" > /system/bin/AndroBox
echo "[+] Generating Unistall Binary ..."
echo "#!/system/bin/sh

echo '[+] Mounting Syatems ...'
mount -o remount,rw /;
mount -o remount,rw /data;
mount -o remount,rw /system;
echo '[+] Removing Data Packages ...'
cd /
cd /data/local/
busybox rm -rf AndroBox
echo '[+] Removing Binary Files ...'
cd /
cd /system/bin
busybox rm AndroBox
echo 'cd / && cd /system/bin && busybox rm unistaller' > /sdcard/asu.sh
cd /sdcard/
sh asu.sh" > /system/bin/unistaller


echo "[+] Chmod AndroBox Binary ..."
busybox chmod 777 /system/bin/AndroBox
busybox chmod 777 /system/bin/unistaller
echo "[+] Removing Log ..."
cd /
cd /data/local/
busybox rm AndroBox.tar.gz
echo "[+] Use Command \033[32mAndroBox\033[0m To Use This Tools"
echo "[+] Use Command \033[32munistaller\033[0m to unistall this tools"