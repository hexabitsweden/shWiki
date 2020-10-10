
FNAME=$1

echo "<p><b>        twiki BETA       </b>" > $1.html
 cat $FNAME | while read line
  do
    HLINE=`echo $line | cut -f1 -d '.'`
    echo "<p><a href="$line.html">$HLINE</a>" >> $1.html 
done

