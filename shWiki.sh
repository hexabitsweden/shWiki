red="\033[0;31m"        
cyan="\033[1;36m"      
green="\033[0;32m"     
blue="\033[0;34m"  
yellow="\e[1;33m" 
black="\033[9;34m"
brown="\033[0;33m"
magenta="\033[0;35m"
gray="\033[0;37m"
bred="\e[0;30;41m" 
bgreen="\e[0;37;42m" 
bgreenb="\e[0;30;42m"
byellow="\e[0;30;43m"
none="\033[0m" 
pink="\e[1;30;31m"
bblue="\e[0;30;46m"
bpurple="\e[0;30;45m"
menucol="\e[0;30;43m"
bwhite="\e[0;31;47m" 
white="\033[0;37m"
#############################################
#                                           # 
#           Terminal wiKi BETA 0.1.1        #
#                                           #
#             Daniel Jendinger 2013         #
#                                           # 
#############################################
listan=wikis/index.wik

MEETER=0
#############################################

searcher () {

clear
echo " "
echo -e "$bred                Terminal Wiki               $none"  
echo -e "                            $cyan Search mode $none"
echo " "
echo " "
echo " "
echo -e "$bred       a=Admin  m=Main menu  h=Help         $none"  
echo " "
printf "          Enter search string:"
read a

clear
echo " "
echo -e "$bred                Terminal Wiki                $none"  
echo -e "$cyan                              Results: $none $yellow"
echo " "
grep -l "$a" wikis/*.wik | cut -f1 -d '.' | cut -f2 -d '0'
echo -e "$none "
echo -e "$bred               ENTER to continue             $none"  
echo " "
read a

main
}

admin_twiki () {
clear
echo " "
STAT=`cat html/serverstatus.txt`
echo -e "        $bred              Terminal Wiki          webbserver:$STAT  $none"  
echo -e "                                    $cyan ADMIN Mode$none"
echo -e "    $yellow     1.$red Delete$none a wikifile $none" 
echo
echo -e "    $yellow     2.$red Delete$none a Category $none"
echo
echo -e "    $yellow     3.$blue Rename$none a Category $none"
echo
echo -e "    $yellow     4.$blue Build$none html-files$none"
echo
echo -e "    $yellow     5.$blue Start$none webserver$none"
echo
echo -e "    $yellow     6.$blue Stop$none webserver$none"
echo
echo -e "    $yellow     7.$blue log$none for webserver$none"
echo
echo -e "    $yellow     8.$blue TextEditor$none for Terminal Wiki$none"
echo
echo -e "    $yellow     9.$blue Webbrowser$none for Terminal Wiki$none"
echo
echo -e "    $yellow     10.$blue Build$none text-files$none"
echo
echo -e "    $yellow     11.$blue Fetch$none entrys from mail$none"
echo
echo -e "    $yellow     0.$blue Back$none $yellow(or ENTER) $none"

echo " "
echo -e "        $bred             Warning! Admin mode Warning!             $none"  

read a
if [[ "$a" == "1" ]]
 then
   printf "Name of wiki: "
    read b
     printf "In wich category:"
      read c
       rm wikis/$b.wik
       cd wikis
        sed "s/$b.wik//g" 0$c.wik > 0$c.wik.tmp
         sed '/^$/d' 0$c.wik.tmp > 0$c.wik
	 cd ..
        rm wikis/0$c.wik.tmp
      echo "ok! Deleted..."
    sleep 1
  main

elif [[ "$a" == "2" ]] 
 then
   printf "Name of category: "
    read b
     rm wikis/0$b.wik 
     echo "ok! Deleted..."
   sleep 1
  main

elif [[ "$a" == "3" ]] 
 then
  printf "Rename wich category?"
   read c
    printf "New name?"
     read d
    mv wikis/0$c.wik wikis/0$d.wik
  echo -e "$bblue OK renamed.. $none"
 admin_twiki

elif [[ "$a" == "4" ]] 
 then
  printf "         Press ENTER to build html-files"
   read c
    cd html
     ./make_html_files.sh > /dev/null 2>&1
   echo " "
  echo -e "         $bblue OK! files ok.. ENTER to continue..$none"
  cd ..
  read a
 admin_twiki

elif [[ "$a" == "10" ]] 
 then
  printf "         Press ENTER to build text-files"
   read c
    cd text
     ./make_txt_files.sh > /dev/null 2>&1
   echo " "
  echo -e "         $bblue OK! files ok.. ENTER to continue..$none"
  cd ..
  read a
  rm wikis/files.txt
  touch wikis/files.txt
 admin_twiki

elif [[ "$a" == "5" ]] 
 then
  printf "         Press ENTER to start a webserver on port 8000..."
   read c
    cd html
    nohup /usr/local/bin/python HTTPserver.py >> http.log &
     echo "ON " > serverstatus.txt
   echo " "
  echo -e "         $bblue OK! Server started.. ENTER to continue..$none"
  cd ..
  read a
 admin_twiki

elif [[ "$a" == "6" ]] 
 then
  printf "         Press ENTER to STOP webserver..."
   read c
    cd html
   kill -9 `ps ax | grep HTTP | grep -v grep | awk '{ print $1 }'` 2> /dev/null
   echo " "
     echo "OFF" > serverstatus.txt
  echo -e "         $bblue OK! Server stopped.. ENTER to continue..$none"
  cd ..
  read a
 admin_twiki

elif [[ "$a" == "7" ]] 
 then
    echo -e "$yellow ENTER to continue.... $none"
    tail html/http.log
   read a
   echo " "
 admin_twiki

elif [[ "$a" == "8" ]] 
 then
	 printf " Witch editor (eg:vim,vi,nano) do you want to use: " 
   read c
   echo " "
  echo -e "         $bblue OK! Setting default editor to:$none $yellow $c $none"
  echo $c > CONFIG/editor.txt
  echo " ENTER to continue...."
  read a
 admin_twiki

elif [[ "$a" == "9" ]] 
 then
	 printf " Witch webbrowser (eg:firefox,lynx,elinks etc) do you want to use: " 
   read c
   echo " "
  echo -e "         $bblue OK! Setting default browser to:$none $yellow $c $none"
  echo $c > CONFIG/browser.txt
  echo " ENTER to continue...."
  read a
 admin_twiki

elif [[ "$a" == "11" ]] 
 then
	 printf " Press ENTER to fetch emails... " 
   read c
   echo " "
  echo " DONE! Press ENTER to continue...."
  read a
 admin_twiki

elif [[ "$a" == "0" ]] 
 then
  main
else
  main
fi
}

write_new () {
clear
echo -e "        $bred                  Terminal Wiki                  $none"  
echo -e "                               $yellow New Category..$none"
echo
echo "(Use existing category or make a new by typing its name)"
echo
printf "Which Category:"
read a
#touch 0$a.wik
printf "Name for wikifile:"
read b
echo $b.wik >> wikis/0$a.wik 
$EDITOR wikis/$b.wik
main
}

cat_subindex () {
clear
echo " "
echo -e "        $bred                Terminal Wiki                $none"  
echo -e "                             Category:$cyan$FNAME0$none "
echo " "
parse_category
echo -e "         $cyan 0. $yellow Back (or Enter)"  
echo " "
echo " "
echo -e "        $bred     a=Admin  s=search  b=browser  h=Help    $none"  
echo " "
printf "          Which subject:"
read a

if [[ "$a" == "n" ]]
 then
  write_new

elif [[ "$a" == "a" ]] 
 then
  admin_twiki

elif [[ "$a" == "0" ]] 
 then
  main 

elif [[ "$a" == "s" ]] 
 then
  searcher

elif [[ "$a" == "h" ]] 
 then
  helper 

 elif [[ "$a" == "b" ]] 
 then
  browse 

elif [[ "$a" == "" ]] 
 then
  main

else
  echo ""
fi

echo " "
FNAME=`cat wikis/files.txt | grep -w "$a" | cut -f2 -d ':'`
clear
DATE=`ls -l wikis/$FNAME | cut -f6 -d ' '`
printf "                                          File:"
echo -e "$cyan $FNAME"
echo 
echo -e " $bwhite                         Last edit:$DATE                         $none" 
echo -e $brown

 cat wikis/$FNAME | while read line
  do
   if [[ $line == .* ]]
     then
      line2=`echo $line | cut -f2 -d'.'`
        color=$yellow
       echo -e $color$line2

#   elif [[ $MEETER == 20 ]]
#     then
#      read a
#      MEETER=0

  elif [[ $line == -* ]]
     then
      line2=`echo $line | cut -f2 -d'-'`
      color=$blue
      echo -e $color$line2

  elif [[ $line == _* ]]
     then
      line2=`echo $line | cut -f2 -d'_'`
      color=$bblue
      echo -e $color$line2

  elif [[ $line == ,* ]]
     then
      line2=`echo $line | cut -f2 -d','`
      color=$red
      echo -e $color$line2


    else
      color=$brown
        echo -e $color$line  
       MEETER=`expr $MEETER + 1`
     fi
done


echo " "
echo -e " $bwhite           Press ENTER for main menu or 'e' for edit           $none" 
read a

if [[ "$a" == "e" ]]
 then
   $EDITOR wikis/$FNAME 

elif [[ "$a" == "a" ]] 
 then
  admin_twiki
else
  echo ""
fi

main

}

parse_category () {
  rm wikis/files.txt
ls wikis/0* > wikis/index.wik
   cat $FNAME | while read LINE
    do
     MEETER=`expr $MEETER + 1`
      LINE1=`echo $LINE\\`
      HLINE=`echo $LINE\\ | cut -f2 -d ':' `
      HLINE2=`echo $LINE\\ | cut -f2 -d ':' | cut -f1 -d '.'`
      echo -e "         $cyan $MEETER. $none $yellow$HLINE2  $none" 
     echo  "$MEETER:$HLINE" >> wikis/files.txt 
   done
}

parse_list () {
  rm wikis/files.txt
   cat $listan | while read LINE
    do
     MEETER=`expr $MEETER + 1`
      LINE1=`echo $LINE\\`
      HLINE=`echo $LINE\\ | cut -f2 -d ':' | cut -d '0' -f2 | cut -f1 -d '.'`
      HLINE0=`echo $LINE\\ | cut -f2 -d ':'`
      echo -e "         $yellow $MEETER. $none $none$HLINE" 
     echo  "$MEETER:$HLINE0" >> wikis/files.txt 
   done
}

helper () {
       a=5
	FNAME=`cat wikis/files.txt | grep -w "$a" | cut -f2 -d ':'`
         FNAME0=`cat wikis/files.txt | grep -w "$a" | cut -f2 -d ':' | cut -d '0' -f2 | cut -f1 -d '.'`
	 echo " "
        echo -e "\n $blue Will now open Terminal Wiki's help menu. You can allso access it from the start menu.. $none"
      sleep 4
    cat_subindex
}

browse () {
	$BROWSER html/index.html
	main
}

main () {
EDITOR=`cat CONFIG/editor.txt | cut -f1 -d ' '`
BROWSER=`cat CONFIG/browser.txt | cut -f1 -d ' '`
ls wikis/0* > wikis/index.wik
clear
STAT=`cat html/serverstatus.txt`
echo " "
echo -e "$yellow        [$bblue              Terminal Wiki           webbserver:$STAT  $none$yellow]$none"  
echo " "
parse_list
echo " "
echo -e "$yellow        [$none$bblue     a=Admin  b=browser s=Search  h=Help  n=New      $none$yellow]$none"  
echo -e "$pink "
printf "          Which category:"
read a

if [[ "$a" == "n" ]]
 then
  write_new

elif [[ "$a" == "a" ]] 
 then
  admin_twiki

elif [[ "$a" == "s" ]] 
 then
  searcher

elif [[ "$a" == "h" ]] 
 then
 helper 

elif [[ "$a" == "b" ]] 
 then
  browse

elif [[ "$a" == "0" ]] 
 then
  main

elif [[ "$a" == "" ]] 
 then
  main

else
  echo ""
fi

echo " "
#FNAME=`cat files.txt | grep $a. | cut -f2 -d ':'`
FNAME=`cat wikis/files.txt | grep -w "$a" | cut -f2 -d ':'`
FNAME0=`cat wikis/files.txt | grep -w "$a" | cut -f2 -d ':' | cut -d '0' -f2 | cut -f1 -d '.'`

cat_subindex

}

ls wikis/0* > wikis/index.wik

main
