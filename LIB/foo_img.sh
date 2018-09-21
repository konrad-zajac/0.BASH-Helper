
#!/bin/bash
function foo_img
{
;;

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
