
#!/bin/bash
function foo_img
{
  case $1 in
 "IO_multiple_crop_many")
        echo -e "This function crops images named 01..02..11..N \n How many photos?"
       read num_ph

    echo "insert the extension"; read ext
    echo "give the starting position X - [X,y]";read X_start_position
    echo "give the starting position Y - [x,Y]"; read Y_start_position
    echo -e "give X of the the output image\n===>\n---\n---";read X_output
    echo -e "give Y of the the output image\n|--\n|--\n|--";read Y_output
	mkdir out

for ((i = 1 ; i <= $num_ph ; i += 1));do
   if [[ $i -le 9 ]];then
	convert "0$i".$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/"0$i".$ext;else
      convert $i.$ext -crop "$X_output"x"$Y_output"+"$X_start_position"+"$Y_start_position" out/$i.$ext;fi
done;;

"IO_single_crop")
      ;;
"IO_rename_photos")
			echo "Insert the year - (this will not change)"
			read year
			echo "Insert the month - (this will not change)"
			read month
            max=1
      for f in *;do
      safety_function
      if [ $max -le 9 ];then
      mv "$f" "R$year M$month D0$max.png";else
      mv "$f" "R$yearM$monthD$max.png";fi
      let max=max+1;
      done;;
    "IO_multipe_crop_one")
    echo -e "This function crops images from one big group\n How many small photos?"
       read num_ph
      echo -e "Enter the big photo name"
      read big_photo

for ((i = 1 ; i <= $num_ph ; i += 1)); do
echo "---------------------photo $i----------------------------"

    echo "give the starting position X - [X,y]"; read Xout
    echo "give the starting position Y - [x,Y]"; read Yout
    echo -e "give X of the the output image\n===\n---\n---"; read Xin
    echo -e "give Y of the the output image\n|--\n|--\n|--"; read Yin

convert $big_photo -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "cpy$i".png
done;;
          "IO_v_merge") ;;
          "IO_h_merge") ;;
      *)  echo "unknown option"
      esac
}
