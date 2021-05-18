myTitle=$1
myLanguage=$2
myRandomUuid=$3

echo '<?xml version="1.0"?>'
echo ''
echo '<package version="2.0" xmlns="http://www.idpf.org/2007/opf" unique-identifier="BookID">'
echo '<metadata xmlns:dc="http://purl.org/dc/elements/1.1/"'
echo ' xmlns:dcterms="http://purl.org/dc/terms/"'
echo ' xmlns:opf="http://www.idpf.org/2007/opf"'
echo ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'
echo ''
echo " <dc:title>${myTitle}</dc:title>"
echo " <dc:language xsi:type=\"dcterms:RFC3066\">${myLanguage}</dc:language>"
echo " <dc:identifier id=\"BookID\">urn:uuid:${myRandomUuid}</dc:identifier>"
echo ' <dc:date xsi:type="dcterms:W3CDTF">2008-12-30</dc:date>'
echo ' <dc:creator opf:file-as="Unknown">Unknown</dc:creator>'
echo ' <dc:publisher>Unknown</dc:publisher>'
echo ' <dc:type>Unknown</dc:type>'
echo ' <dc:rights>Copyright seems to be missing</dc:rights>'
echo '</metadata>'
echo ''
echo '<manifest>'
echo ' <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>'
echo ' <item id="cover" media-type="image/jpeg" href="images/cover.jpg"></item>'
echo ' <item id="style" href="stylesheet.css" media-type="text/css" />'
echo ' <item id="title" href="title.html" media-type="application/xhtml+xml" />'
