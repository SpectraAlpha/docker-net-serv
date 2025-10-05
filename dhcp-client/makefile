.PHONY: build run stop remove restart logs exec

build:
	docker build -t dhcp-client .

run:
	docker run -d --name dhcp-client --network dhcp-net --cap-add NET_ADMIN dhcp-client
stop:
	docker stop dhcp-client
remove:	
	docker rm dhcp-client
logs:
	docker logs -f dhcp-client