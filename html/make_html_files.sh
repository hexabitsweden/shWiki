rm *.html

FNAME=work.txt
ls ../wikis/0* > temp.txt

./index_to_html.sh

ls ../wikis/*.wik > work.txt

 cat $FNAME | while read line
  do
   ./phtml.sh $line
done

mv ../*.html .

 cat temp.txt | while read line
  do
   ./wow.sh $line
done

mv ../wikis/*.html .
rm temp.txt work.txt
