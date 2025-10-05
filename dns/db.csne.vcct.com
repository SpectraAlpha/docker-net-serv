$TTL  604800
@   IN  SOA csne.vcct.com. root.csne.vcct.com. (
        2       ; Serial
        604800  ; Refresh
        86400   ; Retry
        2419200 ; Expire
        604800) ; Negative Cache TTL
;
@       IN  NS  csne.vcct.com.
csne.vcct.com. IN  A   192.168.8.132