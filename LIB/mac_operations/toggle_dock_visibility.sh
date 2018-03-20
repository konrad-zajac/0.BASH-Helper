
function toggle_dock_visibility
{
	if [ $(defaults read com.apple.Dock autohide) == 0 ]
	then
		defaults write com.apple.Dock autohide 1
	else
		defaults write com.apple.Dock autohide 0
	fi
	killall Dock    

}
