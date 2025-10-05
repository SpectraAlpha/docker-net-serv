.PHONY: run stop remove restart logs exec network#non-file targets

build:
	docker build -t mydhcp .

network:
	sudo docker network create -d macvlan \
  	--subnet=192.168.8.0/24 \
 	--gateway=192.168.8.1 \
  	-o parent=eth0 dhcp-net

run:
	docker run -d --name dhcp-server --network dhcp-net --cap-add NET_ADMIN mydhcp
stop:
	sudo docker stop dhcp-server
remove:
	sudo docker rm dhcp-server
restart: stop remove run
logs:
	sudo docker logs -f dhcp-server
exec:
	sudo docker exec -it dhcp-server /bin/sh