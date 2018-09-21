function mulCrpMany
{
    echo -e "This function crops images from one big group\n How many small photos?";read smallPhotosNum
    echo "How many big photos?";read bigPhotoNum
    echo "Enter big photos extension?";read bigPhotoExt

    for ((i = 1 ; i <= $bigPhotonum ; i += 1)); do
        for ((j = 1 ; j <= $smallPhotosNum ; j += 1)); do
        echo -e "BIG-PHOTO-$1-SMALL-PHOTO-$j\n give the starting position X - [X,y]"; read Xout
        echo "give the starting position Y - [x,Y]"; read Yout
        echo -e "give X of the the output image\n===\n---\n---"; read Xin
        echo -e "give Y of the the output image\n|--\n|--\n|--"; read Yin
        convert $i.$bigPhotoExt -crop "$Xin"x"$Yin"+"$Xout"+"$Yout" "cpy$j $i".png
        done
    done
}