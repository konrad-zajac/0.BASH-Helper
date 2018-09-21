function mulCrpOne
{
echo -e "This function crops images named 01..02..11..N \n How many photos?";read num_ph
echo "name of the file from which those $num_ph crops are taken"; read f_name
echo "insert the extension"; read ext
echo "give the starting position X - [X,y]";read X_start_position
echo "give the starting position Y - [x,Y]"; read Y_start_position
echo -e "give X of the the output image\n===>\n---\n---";read X_output
echo -e "give Y of the the output image\n|--\n|--\n|--";read Y_output
mkdir out
for ((i = 1 ; i <= $num_ph ; i += 1));do
    convert $f_name.$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/$i.$ext
done
}