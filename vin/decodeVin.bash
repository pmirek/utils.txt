cd `dirname $0`

test -n "$1" || { echo -e "$0 /path/to/vin.txt\nPath to file with VIN code required as an argument\nSample provided with this script [sampleVin.txt])" ; exit; } 

#ISO 3997
vin=`cat $1|sed 's/\s*//g'`
if [ `echo -n ${vin}|wc -m` -ne 17 ];then exit;fi

manufacturer=`echo ${vin} | awk '{print substr($0,1,3)}'`
vds=`echo ${vin} | awk '{print substr($0,1,9)}'`
vis=`echo ${vin} | awk '{print substr($0,10,17)}'`

echo "ISO 3997"
echo "manufacturer:${manufacturer}"
echo "vds:${vds}"
echo "vis:${vis}"
