all: css/style.css
	jekyll --pygments --no-lsi --safe --server

css/style.css: less/style.less
	lessc less/style.less > css/style.css
