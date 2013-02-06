all:
	./extract-doc.sh manual > _includes/side_bar
	jekyll --pygments --no-lsi --safe --server
