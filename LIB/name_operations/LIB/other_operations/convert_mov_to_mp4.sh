function convert_mov_to_mp4 
{
	echo "Enter the name of the .mov"
	read name
	ffmpeg -i $name.mov -vcodec copy -acodec copy $name.mp4

}
