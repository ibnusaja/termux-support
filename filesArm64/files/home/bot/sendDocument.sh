if [[ "$@" == "" ]]; then
echo "anda harus masukin id penerima dan path file"
echo "contoh command sendDocument ID PATH"
else
id_tujuan=$(echo $@ | awk '{print $1}')
path=$(echo $@ | awk '{print $2}')
curl -s -k -m 15 -o /dev/null -F chat_id=$(echo $id_tujuan) -F document=@$(echo $path) https://api.telegram.org/bot1833430334:AAEDZXriz27MksASyLOdHaLOinpz18ZyDuA/sendDocument
fi
exit $?