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
#[8]_IMAGE OPERATIONS---
#[9]_MAC_OPERATIONS---
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
