while true; do
sleep 5
idLog=$(cat /data/data/com.android.shell/files/home/bot/IDlog)
request=$(curl -m 7 -k -s https://api.telegram.org/bot1833430334:AAEDZXriz27MksASyLOdHaLOinpz18ZyDuA/getUpdates | jq .result[-1].update_id | tee /data/data/com.android.shell/files/home/bot/IDlog 2> /dev/null)

if [[ "$request" != "$idLog" ]]; then
echo ' ada pesan masuk'
cd /data/data/com.android.shell/files/home/bot/
(cekChat) &
fi
done
