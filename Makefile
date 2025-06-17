
install-script:
	cp nc-ddns.sh /usr/bin/nc-ddns

install-svc:
	cp nc-ddns.service /etc/systemd/system && cp nc-ddns.timer /etc/systemd/system

enable-svc:
	systemctl enable nc-ddns.timer
