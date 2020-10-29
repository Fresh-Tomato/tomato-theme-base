#!/usr/bin/env bash

file_path=$(realpath $0)
script_dir=$(dirname ${file_path})
root_dir=$(dirname ${script_dir})

theme_base_path="${root_dir}/themes"
zip_base_path="${root_dir}/zip"

### FUNCTIONS ###
zip_dir_contents() {
    
    theme_dir_path=$1
    theme_name=$(basename -- "${theme_dir_path}")
    echo "theme_name: ${theme_name}"
    echo "theme_dir_path: ${theme_dir_path}"

    zip_file="${theme_name}.zip"
    zip_file_path="${zip_base_path}/${zip_file}"

    # echo "zip_file: ${zip_file}"
    echo "zip_file_path: ${zip_file_path}"

    # REMOVE ZIP FILE IF EXISTS
    if [ -f "${zip_file_path}" ]; then
        rm -f "${zip_file_path}"
    fi

    cd "${theme_dir_path}"
    zip -X -r "${zip_file_path}" ./*

    echo ""

}

# echo "theme_base_path: ${theme_base_path}"

# LOOP THEME DIR
find ${theme_base_path}/* -maxdepth 0 -type d | while read input_dir; do

    # echo "input_dir: ${input_dir}"
    zip_dir_contents ${input_dir}

done

echo "Done."