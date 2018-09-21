function scrShtPth
{
if [[ $screenshot_choice == 0 ]];then
    (mkdir -p ~/Documents/screenshots) && (defaults write com.apple.screencapture location ~/Documents/screenshots)
fi
killall SystemUIServer
}