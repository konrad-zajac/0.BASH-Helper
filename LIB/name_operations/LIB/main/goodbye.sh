function goodbye
{
	echo -e "[0] - run again"
	echo "[9] - delete the app"
	echo "[ANY OTHER KEY] - Quit"
	read end_choice
	case "$end_choice" in
	"0") run_again ;;
	"9") self_destruct ;;
esac
}