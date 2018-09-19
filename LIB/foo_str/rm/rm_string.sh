function rm_string
{
echo "What string to remove?"
read string_to_remove
for f in *;do
    if [[ $f == string_to_remove ]]
    then
        continue
    fi
    safety_function
    mv "$f" "$(echo $f | sed "s/$string_to_remove//g")" 2>/dev/null
done
}
