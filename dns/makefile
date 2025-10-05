.PHONY: run stop remove restart logs #non-file targets

build:
	docker build -t mydns .
run: docker run -d --name dns-server -p 53:53/udp -p 53:53/tcp mydns
stop: docker stop dns-server
remove: docker rm dns-server
logs: docker logs -f dns-server