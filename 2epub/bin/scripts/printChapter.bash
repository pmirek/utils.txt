myFilePath=$1
myFileName=`basename $1`
myChapter=`echo "${myFileName}" | sed 's/\.txt//'`
myEncoding=$2

echo '<?xml version="1.0" encoding="utf-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'
echo '<html xmlns="http://www.w3.org/1999/xhtml">'
echo ''
echo '<head>'
echo " <meta http-equiv=\"Content-Type\" content=\"text/html; charset=${myEncoding}\" />"
echo " <title>${myChapter}</title>"
echo ' <link href="stylesheet.css" type="text/css" rel="stylesheet" />'
echo '</head>'
echo ''
echo '<body>'
echo " <h1 class=\"center\">${myChapter}</h1>"
echo ' <pre>'

cat ${myFilePath} 

echo ' </pre>'
echo '</body>'
echo ''
echo '</html>'
