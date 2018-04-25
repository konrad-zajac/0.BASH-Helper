
function add_to_back
{    for f in *
                do
                    safety_function
                mv "$f" "${f}$what"
                done
            }