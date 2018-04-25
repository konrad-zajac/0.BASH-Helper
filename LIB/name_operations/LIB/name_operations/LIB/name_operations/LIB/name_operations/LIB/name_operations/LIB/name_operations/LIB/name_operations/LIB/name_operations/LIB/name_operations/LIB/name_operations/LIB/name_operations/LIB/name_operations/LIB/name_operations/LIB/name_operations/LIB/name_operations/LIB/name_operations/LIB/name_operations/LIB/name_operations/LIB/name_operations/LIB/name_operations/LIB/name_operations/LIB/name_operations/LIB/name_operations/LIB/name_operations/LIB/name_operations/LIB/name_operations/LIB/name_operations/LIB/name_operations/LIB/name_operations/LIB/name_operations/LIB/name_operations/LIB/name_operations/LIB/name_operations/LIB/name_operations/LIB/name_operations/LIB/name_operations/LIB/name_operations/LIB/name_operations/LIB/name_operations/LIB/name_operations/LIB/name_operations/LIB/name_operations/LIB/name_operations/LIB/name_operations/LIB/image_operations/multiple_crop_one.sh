
function multiple_crop_one
{
    echo -e "This function crops images from one big group\n How many small photos?"
       read num_ph    
      echo -e "Enter the big photo name"
      read big_photo
  
for ((i = 1 ; i <= $num_ph ; i += 1)); do
echo "---------------------photo $i----------------------------"
  
    echo "give the starting position X - [X,y]"
    read Xout
    echo "give the starting position Y - [x,Y]"
    read Yout
    echo -e "give X of the the output image\n===\n---\n---"
    read Xin
    echo -e "give Y of the the output image\n|--\n|--\n|--"
    read Yin       

convert $big_photo -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "cpy$i".png
done
}