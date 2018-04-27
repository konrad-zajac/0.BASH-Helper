#!/bin/bash
source LIB/main/display_manual.sh 
source LIB/main/main_choice.sh 
source LIB/main/self_destruct.sh
source LIB/main/run_again.sh
source LIB/main/safety_function.sh
source LIB/main/delete_everything_else.sh
source LIB/main/goodbye.sh
source LIB/main/quit.sh

source LIB/image_operations/main_io_choice.sh
source LIB/image_operations/image_crop_choice.sh
source LIB/image_operations/single_crop.sh
source LIB/image_operations/multiple_crop_many.sh
source LIB/image_operations/multiple_crop_one.sh
source LIB/image_operations/merge_choice.sh
source LIB/image_operations/merge_vertically.sh
source LIB/image_operations/merge_horizontally.sh

source LIB/other_operations/other_operations_questions.sh
source LIB/other_operations/convert_mov_to_mp4.sh

source LIB/name_operations/questions.sh
source LIB/name_operations/string_manipulation.sh

source LIB/mac_operations/mac_operations_choice.sh
source LIB/mac_operations/change_screenshots_path.sh
source LIB/mac_operations/zero_delay_dock.sh
source LIB/mac_operations/toggle_battery_percentage.sh
source LIB/mac_operations/toggle_hidden_files.sh
#source LIB/mac_operations/toggle_dock_visibility.sh
source foo.sh


#source LIB/script/autoogide_OFF.scpt

function main {
main_choice
echo "Operation done"
ls -l
goodbye					
}
function name_operations
{
questions manipulate
if [[ $string_choice == 0 ]]
then
	questions adding_string
        if [ "$where" == "0" ];then
        string_manipulation add_front
    	elif [ "$where" == "9" ];then
    	string_manipulation add_back
    	elif [ "$where" == "8" ];then
        string_manipulation add_back_ext
    	fi
    elif [[ $string_choice == 9 ]]
    then
	questions removing_string
        if [[ $removing_choice == 0 ]];then
        string_manipulation rm_front
        elif [[ $removing_choice == 9 ]];then
        string_manipulation rm_string
        fi
    elif [[ $string_choice == 8 ]]
    then
	questions modifying_string
			if [[ $modifying_choice == 0 ]];then
            string_manipulation replace_string
            elif [[ $modifying_choice == 9 ]];then
			string_manipulation iterate_ext_from_0
            elif [[ $modifying_choice == 8 ]];then
			string_manipulation iterate_ext_from_1
            elif [[ $modifying_choice == 7 ]];then
			string_manipulation iterate_ext_from_M
            elif [[ $modifying_choice == 6 ]];then
			string_manipulation increment_folders
            elif [[ $modifying_choice == "Q" || "q" ]]
            then
                quit
            elif [[ $modifying_choice == "x" ]]
            then
			foo zxzxz
    fi
    elif [[ $string_choice == "Q" || "q" ]]
    then
        quit
fi
}
function mac_operations
{
    mac_operations_choice
    if [[ $mac_choice == 0 ]]
    then
        zero_delay_dock
    elif [[ $mac_choice == 9 ]]
    then
        change_screenshots_path
    elif [[ $mac_choice == 8 ]]
    then
        toggle_hidden_files
    elif [[ $mac_choice == 7 ]]
    then
        toggle_battery_percentage
    elif [[ $mac_choice == 6 ]]
    then
        toggle_dock_visibility
    elif [[ $mac_choice == "Q" || "q" ]]
    then
        quit
fi
}
function image_operations 
{
main_io_choice
    if [[ $image_choice == 0 ]]
    then
        echo "TODO - crop photo albums"
    elif [[ $image_choice == 9 ]]
    then
        merge_choice
        if [[ $merge_choice == 8 ]]
        then
            merge_horizontally
        elif [[ $merge_choice == 9 ]]
        then
            merge_vertically
        fi
    elif [[ $image_choice == 8 ]]
    then
       single_crop             
    elif [[ $image_choice == 7 ]]
    then
        multiple_crop_many
    elif [[ $image_choice == 6 ]]
    then
        multiple_crop_one
    elif [[ $image_choice == "Q" || "q" ]]
    then
    quit
    fi
}
function other_operations
{
    other_operations_questions

    if [[ $oo_choice == 0 ]]
    then
        convert_mov_to_mp4
    elif [[ $oo_choice == 9 ]] 
    then
        delete_everything_else
    elif [[ $oo_choice == "Q" || "q" ]]
    then
        quit
    fi
}
main $@