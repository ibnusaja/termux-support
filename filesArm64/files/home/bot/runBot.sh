cd /data/data/com.android.shell/files/home/bot/
if [ "$@" == "-s" ]; then
kill -9 $(pgrep -f ./initBot);
else
cd /data/data/com.android.shell/files/home/
export LD_LIBRARY_PATH=/data/data/com.android.shell/files/usr/lib
export HOME=/data/data/com.android.shell/files/home
export TERM=xterm-256color
export PREFIX=/data/data/com.android.shell/files/usr
export PATH=$PATH:/data/data/com.android.shell/files/usr/bin
export comtermux=com.android.shell

chmod -R 700 /data/data/com.android.shell/files
chown -R shell:shell /data/data/com.android.shell/files

ln -s /data/data/com.android.shell/files/home/bot/runBot.sh /data/data/com.android.shell/files/usr/bin/runBot;
ln -s /data/data/com.android.shell/files/home/bot/cek.sh /data/data/com.android.shell/files/usr/bin/cekChat;
ln -s /data/data/com.android.shell/files/usr/bin/busybox /data/data/com.android.shell/files/usr/bin/tee
ln -s /data/data/com.android.shell/files/usr/bin/busybox /data/data/com.android.shell/files/usr/bin/pgrep
ln -s /data/data/com.android.shell/files/usr/bin/busybox /data/data/com.android.shell/files/usr/bin/tr
ln -s /data/data/com.android.shell/files/usr/bin/busybox /data/data/com.android.shell/files/usr/bin/awk
ln -s /data/data/com.android.shell/files/home/bot/sendDocument.sh /data/data/com.android.shell/files/usr/bin/sendDocument
kill -9 $(pgrep -f ./initBot);sleep 2;
(/data/data/com.android.shell/files/home/bot/initBot.sh) &
fi