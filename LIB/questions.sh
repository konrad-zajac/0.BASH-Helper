function questions
{
case $1 in
"display_main")
echo "||=================================||"
      echo "||   BASH HELPER 17 FUNCTIONS      ||"
      echo "||   [h] - Help     [Q] - quit     ||"
      echo "||==========main options===========||"
      echo "||                                 ||" 
      echo "|| [0] - Name operations [13Fun.]  ||" 
      echo "||                                 ||" 
      echo "|| [9] - Mac operations  [5Fun.]   ||" 
      echo "||                                 ||" 
      echo "|| [8] - Image operations[4Fun.]*  ||"  
      echo "||                                 ||" 
      echo "|| [7] - Other operations[3Fun.]** ||" 
      echo "||                                 ||"  
      echo "||=================================||"
      echo "||* - Requires ImageMagic          ||"  
      echo "||* - Requires FFmpeg              ||"  
      echo "||=================================||"
  read main_choice;;
  "manipulate") 
    echo -e "[0]==============================\nadd, remove, or modify  string?"
    echo "[0] Add"
		echo " [->,0] - to the front"
		echo " [->,9] - to the back with extension"                       
		echo " [->,8] - to the back without extension"                       

    echo "[9] Remove"
		echo " [->,0] - number (chars from front)"
		echo " [->,9] - string"                       

	echo "[8] Change"
		echo " [->,0] - Modify"
		echo " [->,9] - Rename from	0 to N"
		echo " [->,8] - Rename from	1 to N"
		echo " [->,7] - Rename from	M to N"
		echo " [->,9] - Increment a series of folders"
		
		echo "[Q] Quit"
  read string_choice;;

  "adding_string") 
    echo -e "[0->0]==========================\nwhere?"
    echo "[0] - [*]flname.txt"
    echo "[9] - flname[*].txt"
    echo "[8] - flname.txt[*]"
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
    echo "[9] Rename filenames from 0 to N"
    echo "[8] Rename filenames from 1 to N"
    echo "[7] Rename filenames from M to N"
    echo "[6] Increment a series of folders, when a duplicate found."
    read modifying_choice;;

 "IO_questions")
    echo "what image operation to perform?"
    echo "[0] - merge"
    echo "[9] - (ONE  format  ONE   image ) crop one image"
    echo "[8] - (ONE  format  MANY images ) crop many images from many images"
    echo "[7] - (MANY formats ONE  image  ) crop many images from one image"
    echo "[Q] - Quit"
    read image_choice;;

  "IO_merge_choice")
    echo -e "merge two pictures veridically or horizontally? (name them 1.ext and 2.ext)\n[0] |||  - vertical\n[9] ---  - horizontal"
    read merge_choice
    echo "insert an extension"
    read ext;;
 
  "mac_operations_questions")
    echo  "what mac operation would you like to do?"
    echo "[0] Make the dock hide delay 0"
    echo "[9] change the path for screenshots"
    if [ $(defaults read com.apple.finder AppleShowAllFiles) == "NO" ];then
    echo "[8] Togglge hidden files - currently [NOT visible]";else
    echo "[8] Togglge hidden files - currently [visible]";fi
    if [ $(defaults read com.apple.menuextra.battery ShowPercent) == "NO" ];then
    echo "[7] Toggle battery percentage - [currently NOT visible]";else
    echo "[7] Toggle battery percentage - [currently visible]";fi
    echo "[6] Show recents in dock"
    if [ $(defaults read com.apple.finder _FXShowPosixPathInTitle -bool) -eq 1 ];then
    echo "[5] Toggle visibilty finder path - [currently visible]";else
    echo "[5] Toggle visibilty finder path - [currently NOT visible]";fi
    if [ $(defaults read  NSGlobalDomain AppleShowAllExtensions -bool ) -eq 1 ];then
    echo "[4] Toggle extension visibility - [currently visible]";else
    echo "[4] Toggle extension visibility - [currently NOT visible]";fi
    
    echo "[Q] Quit"
    read mac_choice;;

  "OO_questions")
    echo -e "[7]==============================\nWhat kind of operation?"
    echo "[H,h] Help"
    echo "[0] Convert mov to mp4"
    echo "[9] sort alphabeticaly"
    echo "[8] copy file many times" 
    echo "[R] Run again"
    echo "[Q] Quit"
    read oo_choice;;
  *) echo "unknown question"
esac
}
