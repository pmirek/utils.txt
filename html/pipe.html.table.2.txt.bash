cat $1 \
 | tr -d '\n' \
 | sed 's/<\/tr>/<\/tr>\n/g; s/<\/td/|<\/td/g; s/<\/th>/\|<\/th/g;' \
 | grep '<\/tr>' \
 | vim -es '+%s/<.\{-}>//g' '+%print' '+:q!' /dev/stdin \
 | sed 's/ \+/ /g'

# echo "
#  this tool should be used in pipline to get text stored in html tables
#  this tool may impact content as removes duplicated spaces
#  example of usage:
#  wget -O - https://www.timeanddate.com/holidays/poland/ | ./pipe.html.table.2.txt.bash
# "
