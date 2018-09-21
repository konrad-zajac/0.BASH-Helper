function tglExtVis
{
if [ $(defaults read  NSGlobalDomain AppleShowAllExtensions -bool ) -eq 1 ];then
    defaults write NSGlobalDomain AppleShowAllExtensions -bool false
else
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi
    killall Finder
}