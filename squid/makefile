
.PHONY: build push run stop remove restart logs

build: 
	docker build -t mysquid .
run:
	-@docker rm -f squid-proxy >/dev/null 2>&1 || true
	docker run -d --name squid-proxy -p 3128:3128 mysquid

stop:
	docker stop squid-proxy
remove:
	docker rm squid-proxy
restart: stop remove build run

logs:
	docker logs squid-proxy
