directories=("$@")

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory1> <directory2> ..."
    exit 1
fi

# 各ディレクトリに対してスクリプトを実行
for dir in "${directories[@]}"; do
    bash scripts/slide-builder.sh "$dir"
done
