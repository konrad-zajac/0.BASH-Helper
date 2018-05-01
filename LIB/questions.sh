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
    echo -e "[0->0]==========================\nwhere?"
    echo "[0] - to the front of the word"
    echo "[9] - to the back of the word"
    echo "[8] - to the back of the word with extension"
    read where
    echo "What to add?"
   read what;;

  "removing_string")
        echo -e "[0->9]===========================\nWhat to remove?"
            echo "[0] - number (chars from front)"
            echo "[9] - string"
                read removing_choice;;
        "modifying_string")
            echo -e "[0->8]===========================\nSelct a modification"
            echo "[0] Modify strings"
            echo "[9] Rename files from 0 to N"
            echo "[8] Rename files from 1 to N"
            echo "[7] Rename files from M to N"
            echo "[6] Increment a series of folders, when a duplicate found."
        read modifying_choice;;

        "IO_qestions")
            echo -e "what image operation to perform?"
            echo "[9] - merge"
            echo "[8] - (one  format  one  image ) crop one image "
            echo "[7] - (one  format  many images) crop many images from many images "
            echo "[6] - (many formats one  image ) crop many images from one image "
            echo "[Q] - Quit"
        read image_choice
        ;;

        "mac_operations_questions")
        echo -e "what mac operation would you like to do?"
echo "[0] Make the dock hide delay 0"
echo "[9] change the path for screenshots"
echo "[8] Toggle hidden files"
echo "[7] Toggle battery percentage"
echo "[Q] Quit"
        read mac_choice;;

        "OO_questions")
    echo -e "[7]==============================\nWhat kind of operation?"
    echo "[H,h] Help"
    echo "[0] Convert mov to mp4"
    echo "[9] sort alphabeticaly"
    echo "[R] Run again"
    echo "[Q] Quit"
    read oo_choice
        ;;
  *) echo "unknown option"
esac
}
