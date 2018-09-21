function oneCrpOne
{
ls -l
echo "name of the file from which ONE crop will be taken"; read f
Ext="${f##*.}"
echo "give the starting position X - [X,y]";read X_start_position
echo "give the starting position Y - [x,Y]"; read Y_start_position
echo -e "give X of the the output image\n===>\n---\n---";read X_output
echo -e "give Y of the the output image\n|--\n|--\n|--";read Y_output
mkdir out
convert $f -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/"cpy".$Ext;open out
}