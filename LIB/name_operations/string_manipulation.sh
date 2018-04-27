function string_manipulation
{
  case $1 in
    "add_front") 
      for f in *;do
        safety_function
        mv "$f" "$what${f}"
      done;;

    "add_back") 
      for f in *;do
        safety_function
        mv "$f" "${f}$what"
      done;;
 
   "add_back_ext")
      for f in *;do
        safety_function
        extension="${f##*.}"
        filename="${f%.*}"
        mv "$f" "${filename}$what.${extension}"
      done;;

     "increment_folders")
        let poprzedni_numer=-1
        for plik in $(ls -1 | grep "[0-9][0-9].*");do
          let numer=$(echo $plik | sed -e "s/^0*//" | cut -d. -f1)
          tekst=$(echo $plik | cut -d. -f2-)
          if [ $poprzedni_numer -eq $numer ];then
            let numer=$numer+1
            nowy_plik=$(printf "%02d.%s" $numer $tekst)
            mv $plik $nowy_plik
          fi
          let poprzedni_numer=$numer
        done;;
        
         "rm_front")
          echo "enter a number of characters to remove from the front "
          read number_to_remove
          let number_to_remove=number_to_remove+1;
          for f in *; do
          safety_function
          mv "$f" "$(echo $f | cut "-c"$number_to_remove"-")"
          done
          ;;

          "rm_string")
          echo "What string to remove?"
                          read string_to_remove
                      for f in *
                      do
                            safety_function
                      mv "$f" "$(echo $f | sed "s/$string_to_remove//g")"
                  done;;
    "replace_string")
    echo "What string to replace?"
            read string_to_replace
            echo "With what?"
            read string_to_replace_with
            for f in *
            do
                    safety_function
            mv "$f" "$(echo $f | sed "s/$string_to_replace/$string_to_replace_with/g")"
        done;;
"iterate_ext_from_0")
 
echo "Insert extension- (without the dot)"
read ext

i=0
	for f in *
	do
		if [ $i -le 9 ]
		then
		safety_function
		mv "$f" "0$i.$ext"
	else
		safety_function
		mv "$f" "$i.$ext"
	fi  
let i=i+1;
    done
	;;
"iterate_ext_from_1")
 
echo "Insert extension- (without the dot)"
read ext

i=1
	for f in *
	do
		if [ $i -le 9 ]
		then
		safety_function
		mv "$f" "0$i.$ext"
	else
		safety_function
		mv "$f" "$i.$ext"
	fi  
let i=i+1;
    done
	;;
"iterate_ext_from_M")
echo "Insert extension - (without the dot)"
read ext

echo "Insert the starting numer - M"
read i
	for f in *
	do
		if [ $i -le 9 ]
		then
		safety_function
		mv "$f" "0$i.$ext"
	else
		safety_function
		mv "$f" "$i.$ext"
	fi  
let i=i+1;
    done
	;;
  *)  echo "unknown option"
    esac
}
