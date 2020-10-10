
FNAME=../wikis/index.wik

echo "<p><b>        twiki BETA       </b>" > index.html
 cat $FNAME | while read line
  do 
    HLINE2=`echo $line | cut -f2 -d '/' | cut -f1 -d '.'`
    HLINE=`echo $line | cut -f2 -d '/' | cut -f1 -d '.' | cut -f2 -d '0'`
    echo "<p><a href="$HLINE2.wik.html">$HLINE</a>" >> index.html 
done

