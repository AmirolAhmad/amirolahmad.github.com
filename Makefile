CHECK=✔
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

all: update build

build:
	@echo "${HR}"
	@echo "Building UP assets..."
	@echo "${HR}"
	@recess --compress _assets/up.less > css/up.css
	@echo "Compiling and Compressing Less and CSS files with Recess... ${CHECK} Done"
	@cat _assets/bootstrap/js/{transition,collapse}.js > js/up.js.tmp
	@cat _assets/up.js >> js/up.js.tmp
	@uglifyjs js/up.js.tmp > js/up.js
	@rm -rf js/up.js.tmp
	@echo "Compiling and Compressing JS files with uglify-js... ${CHECK} Done"
	@echo "${HR}"
	@echo "UP successfully built."
	@echo "${HR}"
	@echo "<3 @caarlos0"

update:
	./script/update

