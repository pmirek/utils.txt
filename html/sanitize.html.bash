vim -es \
 -c ':%s/<script\_.\{-}<\/script>//g' \
 -c ':%s/<iframe\_.\{-}<\/iframe>//g' \
 -c ':%s/<link\_.\{-}<\/link>//g' \
 -c ':wq' \
 $1
