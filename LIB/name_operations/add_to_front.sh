
function add_to_front
{    for f in *
                do
                    safety_function
                mv "$f" "$what${f}"
                done
            }