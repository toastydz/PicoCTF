for i in {1..28}
do
 curl --silent --cookie "name=$i" -X GET "http://mercury.picoctf.net:27177/check" | grep -o "picoCTF{.*}"
done