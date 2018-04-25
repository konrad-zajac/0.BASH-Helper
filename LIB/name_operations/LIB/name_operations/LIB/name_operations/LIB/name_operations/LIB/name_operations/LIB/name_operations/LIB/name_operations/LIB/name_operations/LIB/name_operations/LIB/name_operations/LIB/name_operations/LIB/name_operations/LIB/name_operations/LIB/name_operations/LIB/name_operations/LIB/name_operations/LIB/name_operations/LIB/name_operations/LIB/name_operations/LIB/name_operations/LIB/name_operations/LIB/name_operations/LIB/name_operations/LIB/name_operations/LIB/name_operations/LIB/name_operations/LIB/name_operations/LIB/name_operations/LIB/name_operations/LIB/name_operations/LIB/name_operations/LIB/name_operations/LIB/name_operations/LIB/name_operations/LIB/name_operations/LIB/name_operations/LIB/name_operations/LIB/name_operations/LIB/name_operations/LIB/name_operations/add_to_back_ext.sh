
function add_to_back_ext
		{
		for f in *
			do
			safety_function
	
			extension="${f##*.}"
			filename="${f%.*}"
			mv "$f" "${filename}$what.${extension}"
		done
        }