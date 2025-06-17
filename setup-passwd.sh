echo "Please provide your Dynamic DNS password"

systemd-ask-password | sudo systemd-creds encrypt --name=namecheap-ddns - /root/namecheap.cred
