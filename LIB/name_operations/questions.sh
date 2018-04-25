function questions
{


case $1 in
  "manipulate") 
    echo -e "[0]==============================\nadd, remove, or modify  string?"
    echo "[0] Add"
    echo "- to the front"
    echo "- to the back with extension"                       
    echo "- to the back without extension"                       
    echo -e "[9] Remove\n[8] Change\n - Modify\n - Rename\n - Increment\n [Q] Quit"
    	read string_choice;;
  "adding_string") 
		echo -e "[0->0]===========================\nwhere?\n[0] - to the front of the word\n[9] - to the back of the word with extension\n[8] - to the back of the word"
        read where
        echo "What to add?"
        read what
        ;;
  "removing_string")
        echo -e "[0->9]===========================\nWhat to remove?\n[0] - number (chars from front)\n[9] - string"
                read removing_choice
  ;;
  "modifying_string")
        echo -e "[0->8]===========================\nSelct a modification\n[0] Modify strings\n[9] Rename files from 0 to N\n[8] Rename files from 1 to N\n[7] Rename files from M to N\n[6] Increment a series of folders, when a duplicate found."
        read modifying_choice
  ;;
  *) polecenie_domyślne
esac

}
