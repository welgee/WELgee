CDN_URL:=https://res.cloudinary.com/dehmxyns2/image/upload/v1551771650/welgee
CSS_SRCS:=$(wildcard src/css/*.css)
HTMLS:=$(notdir $(wildcard src/html/*.html))
CSSS:=$(notdir $(wildcard src/css/*.css))
ARTIFACTS:=$(addprefix public/, $(HTMLS)) $(addprefix public/css/, $(CSSS))

.PHONY: all
all: $(ARTIFACTS)
  $(warning $(ARTIFACTS))

public/%.html: src/html/header.html.tmpl src/html/footer.html.tmpl src/html/%.html
	HEADER=$$(IMG_URL=$(CDN_URL) envsubst < src/html/header.html.tmpl) \
  FOOTER=$$(IMG_URL=$(CDN_URL) envsubst < src/html/footer.html.tmpl) \
  IMG_URL=$(CDN_URL) envsubst < src/html/$(@F) > $@

public/css/%: 
	IMG_URL=$(CDN_URL) envsubst < src/css/$(@F) > $@

run:
	docker run --rm -v $(CURDIR)/public:/usr/share/nginx/html -p 8001:80 nginx
