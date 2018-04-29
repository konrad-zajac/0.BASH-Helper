function operations
{
  case $1 in
    "main_choice")
    echo "||=================================||"
  echo "||   BASH HELPER 17 FUNCTIONS      ||"
  echo "||   [h] - Help     [Q] - quit     ||"
  echo "||==========main options===========||"
  echo "||                                 ||" 
  echo "|| [0] - Name operations [13Fun.]  ||" 
  echo "||                                 ||" 
  echo "|| [9] - Mac operations  [4Fun.]   ||" 
  echo "||                                 ||" 
  echo "|| [8] - Image operations[4Fun.]*  ||"  
  echo "||                                 ||" 
  echo "|| [7] - Other operations[2Fun.]** ||" 
  echo "||                                 ||"  
  echo "||=================================||"
  echo "||* - Requires ImageMagic          ||"  
  echo "||* - Requires FFmpeg              ||"  
  echo "||=================================||"


  read main_choice
  case "$main_choice" in 
    "0") name_operations ;;
    "9") mac_operations ;;	
    "8") image_operations;;	
    "7") other_operations;;	
    "h") display_manual;;
    "H") display_manual;;
    "q") operations quit;;
    "Q") operations quit
  esac;;
#string manipulation
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
                  for f in *;do
                    safety_function
                    mv "$f" "$(echo $f | sed "s/$string_to_replace/$string_to_replace_with/g")"
                  done;;

            "iterate_ext_from_0")
            i=0
              for f in *;do
         ext="${f##*.}"
                if [ $i -le 9 ]; then
                safety_function
                mv "$f" "0$i.$ext"
              else
                safety_function
                mv "$f" "$i.$ext"
              fi  
            let i=i+1;
                done;;

        "iterate_ext_from_1")
        i=1
          for f in *;do
         ext="${f##*.}"
            if [ $i -le 9 ];then
            safety_function
            mv "$f" "0$i.$ext"
          else
            safety_function
            mv "$f" "$i.$ext"
          fi  
        let i=i+1;
            done;;

        "iterate_ext_from_M")

        echo "Insert the starting numer - M"
        read i
          for f in *;do
         ext="${f##*.}"
            if [ $i -le 9 ];then
            safety_function
            mv "$f" "0$i.$ext"
          else
            safety_function
            mv "$f" "$i.$ext"
          fi  
          let i=i+1;
            done;;
#image operations---
          "image_merge_horizontally")
          convert 1.$ext 2.$ext +append $result_name.$ext;open $result_name.$ext;;

          "image_merge_vertically")
          convert 1.$ext 2.$ext -append $result_name.$ext;open $result_name.$ext;;
#mac operations---
          "MO_change_screenshots_path")
          echo -e "create the directiry ~/Documments/screenshots and make it the default, or to other?\n[0] - yes \n[9] - no, to other path"
          read screenshot_choice
          if [[ $screenshot_choice == 0 ]];then
          (mkdir -p ~/Documents/screenshots) && (defaults write com.apple.screencapture location ~/Documents/screenshots)
          elif [[ $screenshot_choice == 9 ]];then
          echo "enter path"
          read path
          defaults write com.apple.screencapture location $path
          fi
          killall Dock
          ;;
          "mac_toggle_files_visibility")
          if [ $(defaults read com.apple.finder AppleShowAllFiles) == "NO" ];then
              defaults write com.apple.finder AppleShowAllFiles YES
            else
              defaults write com.apple.finder AppleShowAllFiles NO
            fi
              killall Finder
            killall Terminal;;
#main operations          
          "goodbye")
          echo "[0] - run again"
        echo "[9] - delete the app"
        echo "[ANY OTHER KEY] - Quit"
        read end_choice
        case "$end_choice" in
        "0") operations restart ;;
        "9") operations self_destruct ;;
      esac;;

      "self_destruct")
          echo -e "Are you sure?\n[9] - NO \n[0] - YES "
      read final_end_choice

      if [ "$final_end_choice" == "0" ];then
        rm BasHelper.sh
        rm -r LIB		
      else
        echo "n"
      fi;;

      "quit")
      kill -SIGINT $$
      ;;

      "restart")
      ./$0;;

      *)  echo "unknown option"
      esac
}
