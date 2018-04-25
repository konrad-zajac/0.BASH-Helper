
function multiple_crop
{
    echo -e "This function crops images named 1..2..3..N"
           echo "How many photos?"
       read num_ph    
       echo $num_ph          

    echo "insert the extension"
    read ext
    echo "give the starting position X - [X,y]"
    read Xout
    echo "give the starting position Y - [x,Y]"
    read Yout
    echo -e "give X of the the output image\n===\n---\n---"
    read Xin
    echo -e "give Y of the the output image\n|--\n|--\n|--"
    read Yin       

for ((i = 1 ; i <= $num_ph ; i += 1)); do
convert $i.$ext -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "cpy$i"."$ext"
done
}