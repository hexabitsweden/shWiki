FNAME=work.txt

#ls ../0* > temp.txt

#./index_to_html.sh

ls ../*.wik > work.txt

 cat $FNAME | while read line
  do
   ./phtml.sh $line
done

mv *.txt textfiles/

