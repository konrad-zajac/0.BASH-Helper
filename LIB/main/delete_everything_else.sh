
function delete_everything_else
{
 find . ! -name BasHelper.sh -not -path "./LIB" -delete
}