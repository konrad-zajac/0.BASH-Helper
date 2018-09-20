function tglFinPth
{
if [ $(defaults read com.apple.finder _FXShowPosixPathInTitle -bool) -eq 1 ];then
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false;else
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;fi
killall Finder
}