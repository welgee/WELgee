CDN_URL:=https://res.cloudinary.com/dehmxyns2/image/upload/v1551771650/welgee
CSS_SRCS:=$(wildcard src/css/*.css)
HTML_SRCS:=$(shell find src/html -name "*.html")
CSS_SRCS:=$(shell find src/css -name "*.css")
HTML_PUBS:=$(HTML_SRCS:src/html/%=public/%)
CSS_PUBS:=$(CSS_SRCS:src/%=public/%)

.PHONY: all
all: $(HTML_PUBS) $(CSS_PUBS)

public/%.html: src/html/header.html.tmpl src/html/footer.html.tmpl src/html/%.html
	export HEADER=$$(IMG_URL=$(CDN_URL) envsubst < src/html/header.html.tmpl)
	export FOOTER=$$(IMG_URL=$(CDN_URL) envsubst < src/html/footer.html.tmpl)
	export IMG_URL=$(CDN_URL)
	mkdir -p $(dir $@)
	envsubst < $(@:public/%=src/html/%) > $@
	export -n HEADER FOOTER IMG_URL

public/css/%.css: src/css/%.css
	export IMG_URL=$(CDN_URL)
	mkdir -p $(dir $@)
	envsubst < $< > $@
	export -n IMG_URL

run:
	docker run --rm -v $(CURDIR)/public:/usr/share/nginx/html -p 8001:80 nginx
