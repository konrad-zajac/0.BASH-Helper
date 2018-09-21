function singlCrp
{
echo "insert the filename (without the extension)";read fn
echo "insert the extension";read ext
echo "give the starting position X - [X,y]";read Xout
echo "give the starting position Y - [x,Y]";read Yout
echo -e "give X of the the output image\n===\n---\n---";read Xin
echo -e "give Y of the the output image\n|--\n|--\n|--";read Yin
echo "insert the output fle name";read out
convert $fn.$ext -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "$out"."$ext";open "$out"."$ext"
}