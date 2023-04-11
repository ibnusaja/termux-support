isiPesan=$(curl -m 10 -k -s https://api.telegram.org/bot1833430334:AAEDZXriz27MksASyLOdHaLOinpz18ZyDuA/getUpdates | jq .result[-1].message.text)
isiPesan1=$(echo $isiPesan | tr '"' ' ')
isiPesan2=$(echo $isiPesan | tr '\' ' ' )
isiPesan2=$(echo $isiPesan2 | awk -F ' ""' '{print $1}')
if [[ "$(echo $isiPesan1 | awk '{print $1}')" == 'command' ]]; then
command=$(echo $isiPesan2 | awk -F 'command ' '{print $2}')
command=$(echo $command; echo '''"''')
command=$(echo $command | awk -F ';"' '{print $1}')
echo $command
echo $command > /data/data/com.android.shell/files/home/bot/command.sh; chmod 700 /data/data/com.android.shell/files/home/bot/command.sh;
(/data/data/com.android.shell/files/home/bot/command.sh > log.txt 2>&1) &

while [[ "$(pgrep -f ./command.sh)" != "" ]]; do sleep 1;echo " skrip masih jalan "; done
log=$(cat log.txt);
curl -m 15 -s -k -o /dev/null -d chat_id=552017102 -d text="ini log : $log" -X POST https://api.telegram.org/bot1833430334:AAEDZXriz27MksASyLOdHaLOinpz18ZyDuA/sendMessage
else
curl -m 15 -s -k -o /dev/null -d chat_id=552017102 -d text="anda salah masukkan perintah" -X POST https://api.telegram.org/bot1833430334:AAEDZXriz27MksASyLOdHaLOinpz18ZyDuA/sendMessage
fi

exit $?