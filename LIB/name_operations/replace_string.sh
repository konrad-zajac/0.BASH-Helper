
function replace_string
{
            echo "What string to replace?"
            read string_to_replace
            echo "With what?"
            read string_to_replace_with
            for f in *
            do
                    safety_function
            mv "$f" "$(echo $f | sed "s/$string_to_replace/$string_to_replace_with/g")"
        done
}