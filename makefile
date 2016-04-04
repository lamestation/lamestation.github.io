all: static/css/style.css
	jekyll serve

static/css/style.css: static/less/style.less static/less/custom_variables.less
	lessc static/less/style.less > static/css/style.css

install:
	sudo apt-get install ruby ruby-dev make nodejs node-less
	sudo gem install jekyll --no-rdoc --no-ri
	gem install activesupport --no-rdoc --no-ri
	apt-get install -y zlib1g-dev ruby-execjs
	gem install github-pages --no-rdoc --no-ri
