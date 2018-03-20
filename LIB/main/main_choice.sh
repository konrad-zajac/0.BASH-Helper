
function main_choice
{
echo "||===============================||"
echo "||   BASH HELPER 16 FUNCTIONS    ||"
echo "||===============================||"
echo "|| [h] - Display help            ||" 
echo "||                               ||" 
echo "|| [0] - Name operations [6Fun.] ||" 
echo "||                               ||" 
echo "|| [9] - Mac operations  [4Fun.] ||" 
echo "||                               ||" 
echo "|| [8] - Image operations[4Fun.] ||"  
echo "||                               ||" 
echo "|| [7] - Other operations[2Fun.] ||" 
echo "||                               ||"  
echo "|| [Q] - Quit                    ||" 
echo "||                               ||"  
echo "||===select one from the above===||"


read main_choice
case "$main_choice" in 
	"0") string_operations ;;
	"9") mac_operations ;;	
	"8") image_operations;;	
	"7") other_operations;;	
	"h") display_manual;;
	"H") display_manual;;
	"q") quit;;
	"Q") quit
esac
	
}
