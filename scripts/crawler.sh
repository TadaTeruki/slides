output_path=$1
output_file="${output_path}/routes"

# init files
> "$output_file.txt"
> "$output_file.js"
echo "const SLIDE_ROUTES = [" > "$output_file.js"

find . -name 'info.txt' -print | grep -v "templates/" | while read -r file; do
  relative_path="${file#./}"
  relative_path="${relative_path%info.txt}"
  if [ -n "$relative_path" ]; then
    echo "$relative_path" >> "$output_file.txt"
    info=$(cat $relative_path/info.txt | tr '\n' ';' | sed 's/---[[:space:]]*/\":\"/g' | sed 's/;/\",\"/g' | sed 's/;/\",\"/g')
    echo "[\"$relative_path\", {\"${info}\"}]," >> "$output_file.js"
  fi
done

echo "];" >> "$output_file.js"

echo "Finished."

