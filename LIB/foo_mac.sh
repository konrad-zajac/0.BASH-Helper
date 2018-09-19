#!/bin/bash
function foo_mac
{
    case $1 in
        "MO_zero_dd")

        "MO_change_screenshots_path")
            echo -e "create the directiry ~/Documments/screenshots and make it the default, or to other?\n[0] - yes \n[9] - no, to other path"
            read screenshot_choice
                if [[ $screenshot_choice == 0 ]];then
                    (mkdir -p ~/Documents/screenshots) && (defaults write com.apple.screencapture location ~/Documents/screenshots)
                elif [[ $screenshot_choice == 9 ]];then
                    echo "enter path"
                    read path
                    defaults write com.apple.screencapture location $path
                fi
            killall Dock;;
#_MO_1#########
        "MO_t_hf_vis")
            if [ $(defaults read com.apple.finder AppleShowAllFiles) == "NO" ];then
                defaults write com.apple.finder AppleShowAllFiles YES
            else
                defaults write com.apple.finder AppleShowAllFiles NO
            fi
                killall Finder
                killall Terminal;;
#MO_2#########
        "MO_bty_prc")
            if [ $(defaults read com.apple.menuextra.battery ShowPercent) == "NO" ];then
            defaults write com.apple.menuextra.battery ShowPercent YES;else
            defaults write com.apple.menuextra.battery ShowPercent NO;fi
            killall SystemUIServer;;
#MO_4#########
        "MO_dock_recent")
            defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'; killall Dock;;
#MO_5#########
        "MO_show_path")
            if [ $(defaults read com.apple.finder _FXShowPosixPathInTitle -bool) -eq 1 ];then
                defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
            else
                defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
            fi
            killall Finder;;
#MO_7#########
        "MO_chg_scrt_name")
            echo "enter the prefix of the name"
            read screenshot_name
            defaults write com.apple.screencapture name $screenshot_name
            killall -9 SystemUIServer;;

        "MO_t_ext_vis")
            if [ $(defaults read  NSGlobalDomain AppleShowAllExtensions -bool ) -eq 1 ];then
                echp "vis"
                # defaults write NSGlobalDomain AppleShowAllExtensions -bool false
            else
                echo "not"
                # defaults write NSGlobalDomain AppleShowAllExtensions -bool true
            fi
                killall Finder;;

        *)  echo "unknown option"
    esac
}



      

