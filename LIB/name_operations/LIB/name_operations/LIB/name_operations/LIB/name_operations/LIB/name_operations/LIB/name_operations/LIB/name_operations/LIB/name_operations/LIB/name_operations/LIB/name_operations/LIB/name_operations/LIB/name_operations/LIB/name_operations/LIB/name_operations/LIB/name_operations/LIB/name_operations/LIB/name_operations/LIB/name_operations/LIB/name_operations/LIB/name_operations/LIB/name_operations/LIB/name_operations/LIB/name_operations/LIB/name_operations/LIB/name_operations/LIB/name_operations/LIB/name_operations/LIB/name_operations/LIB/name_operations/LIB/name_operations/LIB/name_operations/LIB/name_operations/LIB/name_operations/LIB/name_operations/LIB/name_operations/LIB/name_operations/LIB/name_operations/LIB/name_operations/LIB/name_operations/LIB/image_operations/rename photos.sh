
function rename photos 
{

			echo "Insert the year - (this will not change)"
			read year
			echo "Insert the month - (this will not change)"
			read month

            max=1
                    for f in *
                    do
                    	safety_function
								if [ $max -le 9 ]
								then
							mv "$f" "R$year M$month D0$max.png"
								else
                        mv "$f" "R$yearM$monthD$max.png"
								fi
                let max=max+1;
                    done
}
