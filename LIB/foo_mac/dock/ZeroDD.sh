function ZeroDD
{
    defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
}