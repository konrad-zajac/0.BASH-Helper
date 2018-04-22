function self_destruct
{
		echo -e "Are you sure?\n[9] - NO \n[0] - YES "
		read final_end_choice

		if [ "$final_end_choice" == "0" ]
		then
			rm 0.BASH.sh
			rm -r LIB		
		else
			echo "n"
		fi

}