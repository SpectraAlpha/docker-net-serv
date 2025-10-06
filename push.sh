docker tag tniromin2/dns-server:latest tniromin2/dns-test:latest
docker tag tniromin2/dhcp-server:latest tniromin2/dhcp-test:latest
docker tag tniromin2/squid-proxy:latest tniromin2/squid-test:latest
docker tag tniromin2/dhcp-client:latest tniromin2/dhcp-client-test:latest

docker push tniromin2/dns-test:latest
docker push tniromin2/dhcp-test:latest
docker push tniromin2/squid-test:latest
docker push tniromin2/dhcp-client-test:latest