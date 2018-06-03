function operations
{
  case $1 in
#1 MAIN CHOICE
    "main_choice")
    questions display_main
      
  case "$main_choice" in 
    "0") name_operations ;;    "9") mac_operations ;;	
    "8") image_operations;;	
    "7") other_operations;;	
    "h") operations help;;
    "H") display_manual;;
    "q") operations quit;;
    "Q") operations quit
  esac;;
###
    "help")
      echo "   !!========================================================================!!"
      echo "   !! [0] - CHANGE THE NAME                                                  !!" 
      echo "   !!  --[0.0] ADD {what,where}                                              !!" 
      echo "   !!            |                                                           !!"
      echo "   !!            |                                                           !!" 
      echo "   !!            |---[0.0.0] -- to the front                                 !!"  
      echo "   !!            |---[0.0.9] -- to the back with extension                   !!"  
      echo "   !!            |---[0.0.8] -- to the back without extension                !!"  
      echo "   !!                                                                        !!"
      echo "   !!                                                                        !!"
      echo "   !!  --[0.9] REMOVE                                                        !!" 
      echo "   !!               |                                                        !!" 
      echo "   !!               --[0.9.0] NUMBER OF CHARACTERS from front                !!"    
      echo "   !!               |                                                        !!"
      echo "   !!               --[0.9.9] STRING                                         !!" 
      echo "   !!                                                                        !!"
      echo "   !!  --[0.8] MODIFY                                                        !!" 
      echo "   !!               |                                                        !!" 
      echo "   !!               --[0.8.0] INCREMENT A SERIES OF FOLDERS                  !!" 
      echo "   !!               --[0.8.9] MODIFY STRINGS                                 !!" 
      echo "   !!               --[0.8.8] RENAME PHOTOS LIKE (R@ M@ D@)m                 !!" 
      echo "   !!               --[0.8.7] RENAME PHOTOS FROM 1 TO N                      !!" 
      echo "   !!                                                                        !!"
      echo "   !!========================================================================!!"
      echo "   !! [9] - MAC OPERATIONS                                                   !!" 
      echo "   !!  |                                                                     !!" 
      echo "   !!  -- [9.0]MAKE THE DOCK DELAY 0                                         !!" 
      echo "   !!  -- [9.9] CHANGR THE PATH FOR SCREENSHOTS                              !!" 
      echo "   !!  -- [9.8]HIDDEN FILES                                                  !!" 
      echo "   !!               |                                                        !!" 
      echo "   !!               --[9.9.0] SHOW                                           !!" 
      echo "   !!               --[9.9.9] HIDE                                           !!" 
      echo "   !!========================================================================!!"
      echo "   !! [8] - IMAGE MANIPULATION[REQUIRES IMAGE MAGIC]                         !!" 
      echo "   !!  |                                                                     !!" 
      echo "   !!  -- [8.0] CROP                                                         !!"
      echo "   !!  -- [8.9] MERGE                                                        !!"
      echo "   !!               |                                                        !!" 
      echo "   !!               --[8.9.0] ||| VERTICAL                                   !!" 
      echo "   !!               --[8.9.9] --- HORIZONTAL                                 !!" 
      echo "   !!                                                                        !!"
      echo "   !!========================================================================!!"
      echo "   !! [7] - CONVERT .mov to .mp4  [REQUIRES "ffmpeg" ]                        !!" 
      echo "   ============================================================================";;
##########
    "goodbye")
        echo -e "[0] - run again\n[9] - delete the app\n[ANY OTHER KEY] - Quit"
        read end_choice
        case "$end_choice" in
        "0") operations restart ;;
        "9") operations self_destruct ;;
      esac;;
##########
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

#[0] STRING MANIPULATION
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
			 mv "./$f" "$(echo $f | cut "-c"$number_to_remove"-")"
          done
          ;;

          "rm_string")
          echo "What string to remove?"
                          read string_to_remove
                      for f in *;do
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
            mv "$f" "0$i.$ext";else
            safety_function
            mv "$f" "$i.$ext";fi  
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
#[8]_IMAGE OPERATIONS---
    "IO_multiple_crop_many")
        echo -e "This function crops images named 01..02..11..N \n How many photos?"
       read num_ph    

    echo "insert the extension"; read ext
    echo "give the starting position X - [X,y]";read X_start_position
    echo "give the starting position Y - [x,Y]"; read Y_start_position
    echo -e "give X of the the output image\n===>\n---\n---";read X_output
    echo -e "give Y of the the output image\n|--\n|--\n|--";read Y_output
	mkdir out

for ((i = 1 ; i <= $num_ph ; i += 1));do
   if [[ $i -le 9 ]];then
	convert "0$i".$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/"0$i".$ext;else
      convert $i.$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/$i.$ext;fi
done;;

"IO_single_crop")
    echo "insert the filename (without the extension)";read fn
    echo "insert the extension";read ext
    echo "give the starting position X - [X,y]";read Xout
    echo "give the starting position Y - [x,Y]";read Yout
    echo -e "give X of the the output image\n===\n---\n---";read Xin
    echo -e "give Y of the the output image\n|--\n|--\n|--";read Yin
    echo "insert the output fle name";read out
    convert $fn.$ext -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "$out"."$ext";open "$out"."$ext"  ;;
"IO_rename_photos")
			echo "Insert the year - (this will not change)"
			read year
			echo "Insert the month - (this will not change)"
			read month
            max=1
      for f in *;do
      safety_function
      if [ $max -le 9 ];then
      mv "$f" "R$year M$month D0$max.png";else
      mv "$f" "R$yearM$monthD$max.png";fi
      let max=max+1;
      done;;
    "IO_multipe_crop_one")
    echo -e "This function crops images from one big group\n How many small photos?"
       read num_ph    
      echo -e "Enter the big photo name"
      read big_photo
  
for ((i = 1 ; i <= $num_ph ; i += 1)); do
echo "---------------------photo $i----------------------------"
  
    echo "give the starting position X - [X,y]"; read Xout
    echo "give the starting position Y - [x,Y]"; read Yout
    echo -e "give X of the the output image\n===\n---\n---"; read Xin
    echo -e "give Y of the the output image\n|--\n|--\n|--"; read Yin       

convert $big_photo -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "cpy$i".png
done;;
          "IO_h_merge") mkdir res;convert tmp/1.$ext tmp/2.$ext +append res/result_h.$ext;open res/result_h.$ext;;
          "IO_v_merge") mkdir res;convert tmp/1.$ext tmp/2.$ext -append res/result_v.$ext;open res/result_v.$ext;;
#[9]_MAC OPERATIONS---
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
          killall Dock;;
#_MO_1#########
          "MO_tf_visibility")
          if [ $(defaults read com.apple.finder AppleShowAllFiles) == "NO" ];then
              defaults write com.apple.finder AppleShowAllFiles YES
            else
              defaults write com.apple.finder AppleShowAllFiles NO
            fi
              killall Finder
             killall Terminal;;
#MO_2#########
    "MO_bty_prc")
      if [ $(defaults read com.apple.menuextra.battery ShowPercent) == "NO" ];then
      defaults write com.apple.menuextra.battery ShowPercent YES;else
      defaults write com.apple.menuextra.battery ShowPercent NO;fi
      killall SystemUIServer;;
#MO_3######### 
    "MO_zero_dd")
    defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock;;
#MO_4#########
    "MO_dock_recent")
    defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'; killall Dock;;
#MO_5#########
    "MO_show_path")
       if [ $(defaults read com.apple.finder _FXShowPosixPathInTitle -bool) -eq 1 ];then
       echo "OK!"
      defaults write com.apple.finder _FXShowPosixPathInTitle -bool false 
      else
       echo "NOK!"
      defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
      fi
      killall Finder;;

#[7]_OTHER OPERATIONS---
#OO_1#########
      "OO_conv_mov2mp4")
          echo "Enter the name of the .mov";read name
          ffmpeg -i $name.mov -vcodec copy -acodec copy $name.mp4;;
#OO_2#########
          "OO_sort") echo "Enter the name of the file to be sorted";read in;filename="${in%.*}";ext="${in##*.}"
          cat $in | sort > ${filename}.sorted.${ext};;
#OO_3#########
  "OO_copy_many_files")
  echo "Enter the filename";read f_name
  echo "Enter the number of copies";read num
  INPUT=$f_name
  for num in $(seq 1 $num);do
  extension="${f_name##*.}"
  if [ $num -le 9 ];then
  cp "$INPUT" "0${num}.${extension}";else
  cp "$INPUT" "$num.${extension}"
  fi
  done
  echo -e "Delete $f_name?\n[0] - NO \n[9] - YES "
  read OO3end_choice
 [[ $OO3end_choice = 9 ]] && rm $f_name || echo "nd";;      

      *)  echo "unknown option"
      esac
}
