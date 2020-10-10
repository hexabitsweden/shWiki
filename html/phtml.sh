
FNAME=$1

 cat $FNAME | while read line
  do
   if [[ $line == .* ]]
     then
      line2=`echo $line | cut -f2 -d'.'`
        color=$yellow
       echo -e "<p><b>$line2</b>" >> $FNAME.html

  elif [[ $line == -* ]]
     then
       line2=`echo $line | cut -f2 -d'-'`
      color=$blue
      echo -e "<p><span style="color:##FF0000">$line2" >> $FNAME.html

  elif [[ $line == _* ]]
     then
      line2=`echo $line | cut -f2 -d'_'`
      color=$bblue
      echo -e "<p><p><span style="color:#0000FF">$line2" >> $FNAME.html

    else
      color=$brown
        echo -e "<p><span style="color:#61380B">$line" >> $FNAME.html  
       MEETER=`expr $MEETER + 1`
     fi
done

