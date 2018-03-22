
function main_choice
{
echo "||===============================||"
echo "||   BASH HELPER 17 FUNCTIONS    ||"
echo "||   [h] - Help     [Q] - quit   ||"
echo "||==========main options=========||"
echo "||                               ||" 
echo "|| [0] - Name operations [7Fun.] ||" 
echo "||                               ||" 
echo "|| [9] - Mac operations  [4Fun.] ||" 
echo "||                               ||" 
echo "|| [8] - Image operations[4Fun.] ||"  
echo "||                               ||" 
echo "|| [7] - Other operations[2Fun.] ||" 
echo "||                               ||"  
echo "||===============================||"


read main_choice
case "$main_choice" in 
	"0") name_operations ;;
	"9") mac_operations ;;	
	"8") image_operations;;	
	"7") other_operations;;	
	"h") display_manual;;
	"H") display_manual;;
	"q") quit;;
	"Q") quit
esac
	
}
