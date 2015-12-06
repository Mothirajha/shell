#!/bin/bash
start=`date +%s`
a=1
url=https://somedomain.com/application/path/page.json
password=password
header='Content-Type: application/json'
while [ $a -le 1002 ]
do
  echo $a
  content=$(curl -u "${password}" -H "${header}" -XGET "${url}")
  echo $content >> $a.txt
  a=`expr $a + 1`
done
end=`date +%s`
runtime=$((end-start))
echo $runtime
echo $runtime >> runtime.txt