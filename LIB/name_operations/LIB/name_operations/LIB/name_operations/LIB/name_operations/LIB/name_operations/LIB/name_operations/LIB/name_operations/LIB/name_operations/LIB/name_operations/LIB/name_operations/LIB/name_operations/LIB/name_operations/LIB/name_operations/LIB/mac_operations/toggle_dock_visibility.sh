
function toggle_dock_visibility
{
	if [ $(defaults read com.apple.Dock autohide) == 0 ]
	then
#	'osascript /Users/konradzajac/Library/Mobile\ Documents/com\~apple\~CloudDocs/0.BASH/LIB/script/autohide_ON.scpt'
	else
	osascript -e 'tell aplication "System Events" to set the autohide of the dock preferences to false' END
	fi

}
