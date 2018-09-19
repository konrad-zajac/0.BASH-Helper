function iter_1
{
echo -e "[0] - single iter 1 2 3...\n[9] - double iter 01 02 03... "
read c
i=1
if [ $c -eq 9 ];then
    for f in *;do
    ext="${f##*.}"
        if [ $i -le 9 ]; then
            safety_function
            mv "$f" "0$i.$ext"
        else
            safety_function
            mv "$f" "$i.$ext"
        fi
    let i=i+1;
    done
else
    for f in *;do
        ext="${f##*.}"
        safety_function
        mv "$f" "$i.$ext"
        let i=i+1;
    done
fi
}