function back_wi_ext
{
for f in *;do
    safety_function
    if [[ $f == *.* ]]
    then
        filename="${f%.*}"
        extension="${f##*.}"
        mv "$f" "${filename}$what.${extension}"
        continue
    fi
    filename="${f%.*}"
    mv "$f" "${filename}$what"
done
}
