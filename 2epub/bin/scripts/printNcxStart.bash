myTitle=$1
myRandomUuid=$2

echo '<?xml version="1.0"?>'
echo '<!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN" "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd">'
echo ''
echo '<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">'
echo ''
echo '<head>'
echo " <meta name=\"dtb:uid\" content=\"urn:uuid:${myRandomUuid}\" />"
echo ' <meta name="dtb:depth" content="1" />'
echo ' <meta name="dtb:totalPageCount" content="0" />'
echo ' <meta name="dtb:maxPageNumber" content="0" />'
echo '</head>'
echo ''
echo '<docTitle>'
echo ''
echo " <text>${myTitle}</text>"
echo ''
echo '</docTitle>'
echo ''
echo '<navMap>'
echo ' <navPoint id="navpoint-1" playOrder="1">'
echo " <navLabel><text>${myTitle}</text></navLabel>"
echo ' <content src="title.html" />'
echo '</navPoint>'
echo ''
