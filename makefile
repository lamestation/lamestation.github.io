all: static/css/style.css
	jekyll serve

static/css/style.css: static/less/style.less static/less/custom_variables.less
	lessc static/less/style.less > static/css/style.css

install:
	sudo apt-get install ruby ruby-dev make nodejs
	sudo gem install jekyll --no-rdoc --no-ri
	sudo gem install github-pages --no-rdoc --no-ri
