
FNAME=$1

 cat $FNAME | while read line
  do
   if [[ $line == .* ]]
     then
      line2=`echo $line | cut -f2 -d'.'`
        color=$yellow


FNAME=$1
echo "<style>
a:link {
  color: #46d9cd;
  background-color: transparent;
  text-decoration: none;
}
a:visited {
  color: #46d9cd;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: pink;
  background-color: transparent;
  text-decoration: underline;
}

p {
    color: #BDBCBC;
}
body {
  background-image: url('back.jpg');
	  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>" >> $FNAME.html

       echo -e "<font size="5">$line2</font>" >> $FNAME.html

  elif [[ $line == -* ]]
     then
       line2=`echo $line | cut -f2 -d'-'`
      color=$blue
      echo -e "<p><span style="color:#60f9ed">$line2" >> $FNAME.html

  elif [[ $line == _* ]]
     then
      line2=`echo $line | cut -f2 -d'_'`
      color=$bblue
      echo -e "<p><p><span style="color:#60f9ed">$line2" >> $FNAME.html

    else
      color=$brown
        echo -e "<p><span style="color:#f4ef50">$line" >> $FNAME.html
       MEETER=`expr $MEETER + 1`
     fi
done

