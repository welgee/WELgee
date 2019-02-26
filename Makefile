.PHONY: all
all: public/index.html public/participation.html

public/%.html: src/header.html.tmpl src/footer.html.tmpl src/%.html.tmpl
	HEADER=$$(cat src/header.html.tmpl) \
  FOOTER=$$(cat src/footer.html.tmpl) \
  envsubst < src/$(@F).tmpl > $@

run:
	docker run --rm -v $(CURDIR)/public:/usr/share/nginx/html -p 8001:80 nginx
