
FNAME=../wikis/index.wik

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
</style>" > index.html
 cat $FNAME | while read line
  do
    HLINE2=`echo $line | cut -f2 -d '/' | cut -f1 -d '.'`
    HLINE=`echo $line | cut -f2 -d '/' | cut -f1 -d '.' | cut -f2 -d '0'`
    echo "<p><a href="$HLINE2.wik.html">$HLINE</a>" >> index.html
done

