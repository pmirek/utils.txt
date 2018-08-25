echo '' > /tmp/data
echo '
<html>
<head>
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
 </head>
 <body>

 <!-- -------------------------------------------------------------------------------------------- --><hr/>

' > tmp.head

for myFile in $(find . -type f | grep -v tmp.head | grep -v tmp.data | grep -v ready.html | grep -v a.bash | sort)
do
 echo "processing [${myFile}]"
 myFileD=$(dirname ${myFile}|sed 's/^\.\///')
 myFileB=$(basename ${myFile})
 myFileId="[${myFileD}] ${myFileB}"

 echo "<br/><a href=\"#${myFileId}\">${myFileId}</a>" >> tmp.head
 echo "<a name=\"${myFileId}\">${myFileId}</a><pre>" >> tmp.data
 cat ${myFile} >> tmp.data
 echo '</pre>' >> tmp.data
done

echo '</body></html>' >> tmp.data
cat tmp.head tmp.data > ready.html
