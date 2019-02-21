

run:
	docker run --rm -v $(CURDIR)/public:/usr/share/nginx/html -p 8001:80 nginx
