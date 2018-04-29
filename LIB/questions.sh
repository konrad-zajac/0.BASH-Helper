function questions
{
case $1 in
  "manipulate") 
      echo -e "[0]==============================\nadd, remove, or modify  string?"
      echo "[0] Add"
      echo " [0,0] - to the front"
      echo " [0,9] - to the back with extension"                       
      echo " [0,8] - to the back without extension"                       
      echo -e "[9] Remove\n[8] Change\n - Modify\n - Rename\n - Increment\n [Q] Quit"
      read string_choice;;
  "adding_string") 
      echo -e "[0->0]===========================\nwhere?"
      echo "[0] - to the front of the word"
      echo "[9] - to the back of the word"
      echo "[8] - to the back of the word with extension"
      read where
      echo "What to add?"
      read what
      ;;
  "removing_string")
        echo -e "[0->9]===========================\nWhat to remove?\n[0] - number (chars from front)\n[9] - string"
                read removing_choice
  ;;
  "modifying_string")
       echo -e "[0->8]===========================\nSelct a modification"
        echo "[0] Modify strings"
        echo "[9] Rename files from 0 to N"
        echo "[8] Rename files from 1 to N"
        echo "[7] Rename files from M to N"
        echo "[6] Increment a series of folders, when a duplicate found."
        read modifying_choice;;

        "mac_operations_questions")
        echo -e "what mac operation would you like to do?\n[0] Make the dock hide delay 0\n[9] change the path for screenshots\n[8] Toggle hidden files\n[7] Toggle battery percentage\n[Q] Quit"
        read mac_choice;;

  *) echo "unknown option"
esac
}
