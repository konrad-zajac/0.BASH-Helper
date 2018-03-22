
function  iterate_ext
{
 
			echo "Insert extension- (without the dot)"
			read ext
			echo -e "from 0 or 1? \n[0] - 0\n[9] - 1"
			read starting_point
				if [[ $starting_point == 0 ]]
					then
					i=0

						for f in *
						do
							echo $i$f
							if [[ "$i" -le 9 ]]
							then
							safety_function
							mv "$f" "0$i.$ext"
						else
							safety_function
							mv "$f" "$i.$ext"
							fi  
	                let i=i+1;
	                    done
	                elif [[ "$starting_point" -eq 9 ]]
					then
					i=1
						for f in *
						do
							if [ $i -le 9 ]
							then
							safety_function
							mv "$f" "0$i.$ext"
						else
							safety_function
							mv "$f" "$i.$ext"
						fi  
	                let i=i+1;
	                    done
	                fi
}