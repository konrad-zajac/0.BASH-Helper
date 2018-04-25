
function  iterate_ext_from_1
{
 
echo "Insert extension- (without the dot)"
read ext

i=1
	for f in *
	do
		if [ $i -le 9 ]
		then
		safety_function
		mv "$f" "0$i.$ext"
	else
		safety_function
		mv "$f" "$i.$ext"
	fi  
let i=i+1;
    done
}
