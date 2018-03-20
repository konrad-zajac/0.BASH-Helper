function self_destruct
{
		echo -e "Are you sure?\n[n] - NO \n[y] - YES "
		read final_end_choice

		if [ "$final_end_choice" == "y" ]
		then
			rm 0.BASH.sh
			rm -r LIB		
		else
			echo "n"
		fi

}