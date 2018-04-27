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

        "inc_f")
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
  *)  echo "unknown option"
    esac
}
