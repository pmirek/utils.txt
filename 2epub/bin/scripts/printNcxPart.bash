myChapter=$1
mySeqNum=$2

echo "<navPoint id=\"navpoint-${mySeqNum}\" playOrder=\"${mySeqNum}\">"
echo " <navLabel><text>${myChapter}</text></navLabel>"
echo " <content src=\"chapter_${myChapter}.html\" />"
echo "</navPoint>"
echo ""
