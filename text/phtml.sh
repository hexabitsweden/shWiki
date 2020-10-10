
FNAME=$1

 cat $FNAME | while read line
  do
   if [[ $line == .* ]]
     then
      line2=`echo $line | cut -f2 -d'.'`
        color=$yellow
       echo -e "$line2" >> textfiles/$FNAME.txt

  elif [[ $line == -* ]]
     then
       line2=`echo $line | cut -f2 -d'-'`
      color=$blue
      echo -e "$line2" >> textfiles/$FNAME.txt

  elif [[ $line == _* ]]
     then
      line2=`echo $line | cut -f2 -d'_'`
      color=$bblue
      echo -e "$line2" >> textfiles/$FNAME.txt

    else
      color=$brown
        echo -e "$line" >> textfiles/$FNAME.txt 
       MEETER=`expr $MEETER + 1`
     fi
done

