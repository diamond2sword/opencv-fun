#!/bin/bash


(return 0 2>/dev/null)
if [[ $? == 0 ]]; then
	echo must be executed directly
	return 1
fi

_cmd_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

if ! [[ "$_dir" ]]; then
	_dir=$_cmd_dir/open-camera
	mkdir -p $_dir
fi

if ! [[ "$_ext" ]]; then
	_ext="jpg"
fi

_put()
{
	xargs -d'\n' -n1 rm -f <<< "$_prev_files"
	echo -n "$_files" | sort -r | head -n1
	# _file=$(echo -n "$_files" | sort -r | head -n1)
	# _temp="$_cmd_dir/temp.$_ext"
	# cp "$_file" "$_temp"
	# echo "$_temp"
}

while true; do
	_files=$(find $_dir -mindepth 1 -maxdepth 1 | grep "$_ext$")
	_count=$(wc -l <<< "$_files")
	((_count > _prev_count)) && _put
	_prev_files="$_files"
	_prev_count=$_count
done
