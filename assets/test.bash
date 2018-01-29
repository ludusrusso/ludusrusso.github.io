find . -depth -type d \! -name 'imgs' -exec bash -c 'cd $0 || exit; mkdir thumbs 2> /dev/null; shopt -s nullglob; mogrify -path thumbs -resize 200x *.jpg *.svg *.png ' {} \;
