#!/bin/bash

FROM_DIR=/mnt
TO_DIR=/mnt/converted

# ディレクトリ内の拡張子.HEICファイルを対象にループ処理を行う
for file in "$FROM_DIR"/*.HEIC; do
    [ -f "$file" ] || continue

    filename_with_ext=$(basename "$file")
    filename="${filename_with_ext%.*}"
    jpg_file="${TO_DIR}/${filename}.jpg"

    echo "Processing: $filename_with_ext"

    # HEIC→JPGに変換
    convert "$file" -auto-orient "$jpg_file"

    # exif情報をコピー
    exiftool -overwrite_original -TagsFromFile "$file" -All:All --Orientation -Orientation#=1 "$jpg_file"

    # JPGファイルの更新日時をHEICファイルと一致させる
    touch -r "$file" "$jpg_file"
done