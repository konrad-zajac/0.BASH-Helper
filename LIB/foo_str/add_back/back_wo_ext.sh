function back_wo_ext
{
for f in *;do
    if filename="${f%.*}"
    then
        safety_function
        mv "$f" "${f}$what"
    fi
done
}