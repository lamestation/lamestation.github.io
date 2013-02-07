#!/bin/bash

repeat_char() { seq -s "$1" "$2" | sed 's/[0-9]//g' ; }
bump_line() { sed -e 's/^/'`repeat_char "$1" $2`'/g' ;}

get_from_matter() { head -n 4 $FILE | grep "$1" | cut -d':' -f 2 | sed -e 's/^[ \t]*//g' ; }


explore_dir() {
	pushd "$1" 1>/dev/null 2>/dev/null
	STACK=$[$STACK+1]
	COUNT=$[$COUNT+1]
	FULLPATH=`echo $FULLPATH/$1 | sed -e 's@[/]\+@/@g'`

	local DIRS=`ls -d */ 2>/dev/null`
	local FILES=`find . -maxdepth 1 -not -name ".git" -name \*.md`

	NAME=`echo $1 | sed -e 's@/@@g'`

	if [[ "$STACK" -gt "1" ]] ; then
		echo "  <div class=\"accordion-group\">"

		echo "    <div class=\"accordion-heading\">"
		echo "      <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapse$COUNT\">"
		echo "      <strong>$NAME</strong>"
		echo "      </a>"
		echo "    </div>"

		echo "    <div id=\"collapse$COUNT\" class=\"accordion-body collapse\">"
		echo "      <div class=\"accordion-inner\">"
		echo "      <ul class=\"nav nav-list\">"

		for FILE in $FILES 
		do
			FILEMATCH=`echo $FILE | grep "index.md"`
			if [[ -z "$FILEMATCH" ]] ; then
				FMATTER=`head -n 1 $FILE | grep "^\\-\\-\\-$"`
				if [[ -n "$FMATTER" ]] ; then
					TITLE=`get_from_matter "title"`
					echo $FILE | sed -e 's@^./@@' \
						| sed -e 's@.md@.html@g' \
						| sed -e 's@.*@<li><a href=\"'"$FULLPATH"'&\">'"$TITLE"'</a></li>@g' \
						| sed -e 's/^/'`repeat_char "\t" 2`'/g'
				fi
			fi
		done

		echo "      </ul>"
		echo "      </div>"
		echo "    </div>"

		echo "  </div>"
	fi

	for DIR in $DIRS
	do
		explore_dir $DIR
	done

	FULLPATH=`dirname $FULLPATH`
	STACK=$[$STACK-1]
	popd 1>/dev/null 2>/dev/null
}

FULLPATH=""
STACK="0"
CHAPTER="0"

echo "<div class=\"accordion\" id=\"accordion2\">"

EXPLOREPATH="$1"
if [[ -z "$EXPLOREPATH" ]] ; then EXPLOREPATH="." ; fi

explore_dir "$EXPLOREPATH/"

echo "</div>"
