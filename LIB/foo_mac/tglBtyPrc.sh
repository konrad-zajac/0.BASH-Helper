function tglBtyPrc
{
if [ $(defaults read com.apple.menuextra.battery ShowPercent) == "NO" ];then
defaults write com.apple.menuextra.battery ShowPercent YES;else
defaults write com.apple.menuextra.battery ShowPercent NO;fi
killall SystemUIServer
}