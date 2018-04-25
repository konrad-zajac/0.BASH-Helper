
function remove_from_front
{
	echo "enter a number of characters to remove from the front "
	read number_to_remove
	let number_to_remove=number_to_remove+1;
	for f in *
	do
		safety_function
	mv "$f" "$(echo $f | cut "-c"$number_to_remove"-")"
	done

}