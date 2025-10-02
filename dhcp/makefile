.PHONY: run stop remove restart logs exec #non-file targets

build:
	docker build -t mydhcp .
run:
	sudo docker run -d --name dhcp-server \
	  --network host \
	  --cap-add NET_ADMIN \	
	  mydhcp
stop:
	sudo docker stop dhcp-server
remove:
	sudo docker rm dhcp-server
restart: stop remove run
logs:
	sudo docker logs -f dhcp-server
exec:
	sudo docker exec -it dhcp-server /bin/sh