#! /usr/bin/env bash

source=$(cd $(dirname $0) && pwd)

theme_name=SweetPastel

if [[ $UID -eq "0" ]]; then
  aurorae_dir="$HOME/.local/share/aurorae/themes"
  schemes_dir="$HOME/.local/share/color-schemes"
  kvantum_dir="$HOME/.config/Kvantum"
  # plasma_dir="$HOME/.local/share/plasma/desktoptheme"
  # lookfeel_dir="$HOME/.local/share/plasma/look-and-feel"
  # wallpaper_dir="$HOME/.local/share/wallpapers"
else
  aurorae_dir="$HOME/.local/share/aurorae/themes"
  schemes_dir="$HOME/.local/share/color-schemes"
  kvantum_dir="$HOME/.config/Kvantum"
  # plasma_dir="$HOME/.local/share/plasma/desktoptheme"
  # lookfell_dir="$HOME/.local/share/plasma/look-and-feel"
  # wallpaper_dir="$HOME/.local/share/wallpapers"
fi

[[ ! -d $aurorae_dir ]] && mkdir -p $aurorae_dir
[[ ! -d $schemes_dir ]] && mkdir -p $schemes_dir
[[ ! -d $kvantum_dir ]] && mkdir -p $kvantum_dir
# [[ ! -d $plasma_dir ]] && mkdir -p $plasma_dir
# [[ ! -d $lookfell_dir ]] && mkdir -p $lookfell_dir
# [[ ! -d $wallpaper_dir ]] && mkdir -p $wallpaper_dir

install () {
  name=$1

  [[ -d $aurorae_dir/${name} ]] && rm -rf $aurorae_dir/${name}*
  [[ -f $schemes_dir/${name}.colors ]] && rm -rf $schemes_dir/${name}*.colors
  [[ -d $kvantum_dir/${name} ]] && rm -rf $kvantum_dir/${name}*
  # [[ -d $plasma_dir/${name} ]] && rm -rf $plasma_dir/${name}*
  # [[ -d $lookfell_dir/com.github.deathemonic.${name} ]] && rm -rf $lookfell_dir/com.github.deathemonic.${name}*
  # [[ -d $wallpaper_dir/${name} ]] && rm -rf $wallpaper_dir/${name}

  cp -r $source_dir/aurorae/* $aurorae_dir
  cp -r $source_dir/color-schemes/*.colors $schemes_dir
  cp -r $source_dir/Kvantum/* $kvantum_dir
  # cp -r $source_dir/plasma/desktoptheme/* $plasma_dir
  # cp -r $source_dir/plasma/look-and-feel/* $lookfell_dir
  # cp -r $source_dir/wallpaper/* $wallpaper_dir
}

echo "Installing '${theme_name} kde themes'..."

install "${name:-${theme_name}}"

echo "Install finished..."