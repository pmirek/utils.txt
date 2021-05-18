cd `dirname $0`


mySepartor='----------------------'
# give the relative path here do directory with files
# all files should be readable and text format with extension .txt
myInput='../input/bajki.na.dwa.latka'
myTitle=`basename $myInput`
myAuthor='Unknown'
#myEncoding='ISO-8859-2'
myEncoding='utf-8'
myLanguage='pl'
myLanguageFull='polish'
myTimestamp=`date +%s`
myRandomUuid=`cat /proc/sys/kernel/random/uuid`

echo ''
echo ${mySepartor}
echo "creating default structures in [${PWD}/../output]"
find ../output -type f | xargs rm 
find ../output -type d | xargs rmdir

cp -r ../template/* ../output

echo ''
echo ${mySepartor}
echo "creating title page for title [${myTitle}] and author [${myAuthor}]"
./scripts/printTitlePage.bash ${myTitle} ${myAuthor} ${myEncoding} > ../output/OEBPS/title.html

./scripts/printOpfStart.bash ${myTitle} ${myLanguage} ${myRandomUuid} > ../output/OEBPS/stage1.opf
./scripts/printOpfMid.bash > ../output/OEBPS/stage3.opf
./scripts/printOpfEnd.bash > ../output/OEBPS/stage5.opf

./scripts/printNcxStart.bash ${myTitle} ${myRandomUuid} > ../output/OEBPS/stage1.ncx
./scripts/printNcxEnd.bash > ../output/OEBPS/stage3.ncx

echo ''
echo ${mySepartor}
echo "creating chapters"
myFiles=`ls -1 ${myInput}`
mySeqNum=1
for myFile in ${myFiles}
do

 mySeqNum=$(( $mySeqNum + 1 ))
 myChapter=`echo "${myFile}" | sed 's/\.html$//'`
 myChapterFile="../output/OEBPS/chapter_${myChapter}.html"

 echo "[${myChapter}]"
 cp ${myInput}/${myFile} ${myChapterFile}
 # all encoding should be already set correctly in html
 #enca -L ${myLanguageFull} -x ${myEncoding} ${myChapterFile}

 ./scripts/printOpfPart1.bash ${myChapter} >> ../output/OEBPS/stage2.opf
 ./scripts/printOpfPart2.bash ${myChapter} >> ../output/OEBPS/stage4.opf

 ./scripts/printNcxPart.bash ${myChapter} ${mySeqNum} >> ../output/OEBPS/stage2.ncx

done

cat ../output/OEBPS/stage?.opf > ../output/OEBPS/content.opf
cat ../output/OEBPS/stage?.ncx > ../output/OEBPS/toc.ncx
rm -f ../output/OEBPS/stage?.opf ../output/OEBPS/stage?.ncx

echo ''
echo ${mySepartor}
echo "packaging epub into single file"
cd ../output/
rm -f ../${myTitle}.epub
zip -X ../${myTitle}.epub mimetype
zip -ru ../${myTitle}.epub META-INF
zip -ru ../${myTitle}.epub OEBPS
ls -al ../${myTitle}.epub
