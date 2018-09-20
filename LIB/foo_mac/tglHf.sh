function tglHf
{
if [ $(defaults read com.apple.finder AppleShowAllFiles) == "NO" ];then
    defaults write com.apple.finder AppleShowAllFiles YES
else
    defaults write com.apple.finder AppleShowAllFiles NO
fi
    killall Finder
    killall Terminal
}