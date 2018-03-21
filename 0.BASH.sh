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

source LIB/string_operations/so_questions.sh
source LIB/string_operations/increment_folders.sh
source LIB/string_operations/string_adding_questions.sh
source LIB/string_operations/replace_string.sh
source LIB/string_operations/remove_from_front.sh
source LIB/string_operations/remove_string.sh
source LIB/string_operations/string_removing_questions.sh
source LIB/string_operations/iterate_ext.sh
source LIB/string_operations/add_to_front.sh
source LIB/string_operations/add_to_back.sh
source LIB/string_operations/add_to_back_ext.sh
source LIB/string_operations/mod_choice.sh

source LIB/mac_operations/mac_operations_choice.sh
source LIB/mac_operations/change_screenshots_path.sh
source LIB/mac_operations/zero_delay_dock.sh
source LIB/mac_operations/toggle_battery_percentage.sh
source LIB/mac_operations/toggle_hidden_files.sh
#source LIB/mac_operations/toggle_dock_visibility.sh



#source LIB/script/autoogide_OFF.scpt

function main {
main_choice
echo "Operation done"
ls -l
goodbye					
}
function string_operations
{
so_questions
if [[ $string_choice == 0 ]]
then
    string_adding_questions
        if [ "$where" == "0" ]
        then
        add_to_front
    	elif [ "$where" == "9" ]
    	then
    	add_to_back
    	elif [ "$where" == "8" ]
    	then
    	add_to_back_ext
    	fi
    elif [[ $string_choice == 9 ]]
    then
        string_removing_questions
        if [[ $removing_choice == 0 ]]
        then
            remove_from_front		
        elif [[ $removing_choice == 9 ]]
        then
            remove_string
        fi
    elif [[ $string_choice == 8 ]]
    then
        mod_choice
			if [[ $modifying_choice == 0 ]]
			then
                replace_string
            elif [[ $modifying_choice == 9 ]]
            then
                iterate_ext
            elif [[ $modifying_choice == 8 ]]
            then
			increment_folders
            elif [[ $modifying_choice == "Q" || "q" ]]
            then
                quit
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
