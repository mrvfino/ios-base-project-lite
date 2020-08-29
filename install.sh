
item="iOS Base Project Lite.xctemplate"
installDirectory=~/Library/Developer/Xcode/Templates/Project\ Templates/
baseAppDirectory="${installDirectory}/${item}"

mkdir -p "${installDirectory}"

cp -R "${item}" "${installDirectory}"

echo "Templates installed to ${installDirectory}"
