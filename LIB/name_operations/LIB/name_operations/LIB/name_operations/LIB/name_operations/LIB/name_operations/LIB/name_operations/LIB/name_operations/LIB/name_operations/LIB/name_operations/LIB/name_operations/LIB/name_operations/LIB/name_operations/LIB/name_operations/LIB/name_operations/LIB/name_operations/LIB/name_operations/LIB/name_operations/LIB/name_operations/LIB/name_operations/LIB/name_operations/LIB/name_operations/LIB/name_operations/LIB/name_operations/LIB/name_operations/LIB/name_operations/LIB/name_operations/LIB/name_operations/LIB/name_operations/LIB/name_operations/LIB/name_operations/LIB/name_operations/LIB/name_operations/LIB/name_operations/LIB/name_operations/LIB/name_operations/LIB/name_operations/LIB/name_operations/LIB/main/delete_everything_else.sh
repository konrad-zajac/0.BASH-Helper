
function delete_everything_else
{
 find . ! -name 0.BASH.sh -not -path "./LIB" -delete
}