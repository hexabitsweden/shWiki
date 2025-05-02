
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
</style>" > $1.html
 cat $FNAME | while read line
  do
    HLINE=`echo $line | cut -f1 -d '.'`
    echo "<p><a href="$line.html">$HLINE</a>" >> $1.html
done

