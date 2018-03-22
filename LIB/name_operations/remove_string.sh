
function remove_string
{
    echo "What string to remove?"
                read string_to_remove
            for f in *
            do
                   safety_function
            mv "$f" "$(echo $f | sed "s/$string_to_remove//g")"
        done
}