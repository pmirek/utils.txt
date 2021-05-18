cd `dirname $0`

test -n "$1" || { echo -e "$0 /path/to/vag.txt\nPath to file with VAG codes required as an argument\nSample provided with this script [sampleVag.txt])" ; exit; } 

echo ''
echo 'code:group:description' | column -t -s':'
echo '.....................................'

for code in `cat $1`
do
 grep -i "^$code" ./vagCodes.txt | column -t -s':'
done

