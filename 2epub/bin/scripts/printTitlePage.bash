myTitle=$1
myAuthor=$2
myEncoding=$3

echo '<?xml version="1.0" encoding="utf-8"?>'
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'
echo ''
echo '<html xmlns="http://www.w3.org/1999/xhtml">'
echo '<head>'
echo " <meta http-equiv=\"Content-Type\" content=\"text/html; charset=${myEncoding}\" />"
echo ' <title>Title Page</title>'
echo ' <link href="stylesheet.css" type="text/css" rel="stylesheet" />'
echo '</head>'
echo ''
echo '<body>'
echo ''
echo " <h1 class=\"center\">${myTitle}</h1>"
echo " <h2 class=\"center\">${myAuthor}</h2>"
echo ''
echo ' <div class="center">'
echo '  <img src="images/cover.jpg" width="400" height="600" alt="cover"/>'
echo ' </div>'
echo ''
echo '</body>'
echo ''
echo '</html>'
