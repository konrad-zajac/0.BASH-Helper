#!/bin/bash
source LIB/questions.sh
source LIB/operations.sh

source LIB/main/safety_function.sh
source LIB/main/delete_everything_else.sh


#source LIB/mac_operations/toggle_dock_visibility.sh


#source LIB/script/autoogide_OFF.scpt

function main {
operations main_choice
echo "Operation done"
ls -l
operations goodbye					
}
function name_operations
{
questions manipulate
if [[ $string_choice == 0 ]];then
        questions adding_string
        if [ "$where" == "0" ];then
        operations add_front
        elif [ "$where" == "9" ];then
        operations add_back
        elif [ "$where" == "8" ];then
        operations add_back_ext
    fi
    elif [[ $string_choice == 9 ]];then
	questions removing_string
        if [[ $removing_choice == 0 ]];then
        operations rm_front
        elif [[ $removing_choice == 9 ]];then
        operations rm_string
        fi
    elif [[ $string_choice == 8 ]]
    then
	questions modifying_string
			if [[ $modifying_choice == 0 ]];then
            operations replace_string
            elif [[ $modifying_choice == 9 ]];then
			operations iterate_ext_from_0
            elif [[ $modifying_choice == 8 ]];then
			operations iterate_ext_from_1
            elif [[ $modifying_choice == 7 ]];then
			operations iterate_ext_from_M
            elif [[ $modifying_choice == 6 ]];then
			operations increment_folders
            elif [[ $modifying_choice == "Q" || "q" ]]
            then
                operations quit
       fi
    elif [[ $string_choice == "Q" || "q" ]]
    then
        operations quit
fi
}
function mac_operations
{
    questions mac_operations_questions
    if [[ $mac_choice == 0 ]];then
        operations MO_zero_dd
    elif [[ $mac_choice == 9 ]];then
        operations MO_change_screenshots_path
    elif [[ $mac_choice == 8 ]];then
        operations MO_tf_visibility
    elif [[ $mac_choice == 7 ]];then
        operations MO_bty_prc
    elif [[ $mac_choice == 6 ]];then
        operations MO_dock_recent
    elif [[ $mac_choice == "Q" || "q" ]];then
        operations quit
    fi
}
function image_operations 
{
	questions IO_questions
    if [[ $image_choice == 0 ]]; then
        questions IO_merge_choice
        if [[ $merge_choice == 0 ]];then
           operations IO_h_merge
        elif [[ $merge_choice == 9 ]];then
           operations IO_v_merge 
        fi
    elif [[ $image_choice == 9 ]];then
       operations IO_single_crop             
    elif [[ $image_choice == 8 ]]
    then    
        operations IO_multiple_crop_many
    elif [[ $image_choice == 7 ]]
    then
        operations IO_multiple_crop_one
    elif [[ $image_choice == "Q" || "q" ]]
    then
    operations quit
    fi
}
function other_operations
{
  questions OO_questions

    if [[ $oo_choice == 0 ]]
    then
      operations OO_conv_mov2mp4
    # elif [[ $oo_choice == 9 ]] 
    # then
    #     operations delete_else
    elif [[ $oo_choice == 9 ]] 
    then
        operations OO_sort
    elif [[ $oo_choice == "Q" || "q" ]]
    then
        operations quit
    fi
}
main $@
