
function change_screenshots_path
{
	echo -e "change to the default - ~/Documments/screenshots ?\n[0] - yes \n[9] - no, to other path"
read screenshot_choice
 if [[ $screenshot_choice == 0 ]]
    then
   $(mkdir -p ~/Documments/screenshots) 
   defaults write com.apple.screencapture location ~/Documments/screenshots
    elif [[ $screenshot_choice == 9 ]]
    then

        echo "enter path"
        read path
    defaults write com.apple.screencapture location $path
fi
        killall Dock

}
