
function multiple_crop_many
{
    echo -e "This function crops images named 01..02..11..N"
           echo "How many photos?"
       read num_ph    
       echo $num_ph          

    echo "insert the extension"
    read ext
    echo "give the starting position X - [X,y]"
    read X_start_position
    echo "give the starting position Y - [x,Y]"
    read Y_start_position
    echo -e "give X of the the output image\n===>\n---\n---"
    read X_output
    echo -e "give Y of the the output image\n|--\n|--\n|--"
    read Y_output
	mkdir out

for ((i = 1 ; i <= $num_ph ; i += 1));
do
   if [[ $i -le 9 ]]
    then
    convert 0$i.$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" "out/min-0$i"."$ext"
    else
      convert $i.$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" "out/min-$i"."$ext"
    fi
done
}
