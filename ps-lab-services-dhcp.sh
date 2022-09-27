#!/bin/bash
# Prepares ISC DHCP in a deployed VM.
set -v
echo '> Installing ISC DHCP'
apt update
apt install -y isc-dhcp-server
systemctl enable isc-dhcp-server

echo '> Creating dhcp.conf file to identify and provide addresses'
tee /etc/dhcp/dhcpd.conf>/dev/null <<EOL
# option definitions common to all supported networks...
option domain-name "ps.labs.local";
option domain-search "ps.labs.local";
option domain-name-servers 10.89.100.152, 10.89.100.153;
option ntp-servers pool.ntp.org, time.google.com, time.windows.com;

default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;

# DHCP server to understand the network topology.
subnet 10.89.128.0 netmask 255.255.255.0 {
}

subnet 10.89.130.0 netmask 255.255.255.0 {
    option routers 10.89.130.1;
    range 10.89.130.10 10.89.130.254;
}
subnet 10.89.132.0 netmask 255.255.255.0 {
    option routers 10.89.132.1;
    range 10.89.132.10 10.89.132.254;
}
subnet 10.89.134.0 netmask 255.255.255.0 {
    option routers 10.89.134.1;
    range 10.89.134.10 10.89.134.254;
}
subnet 10.89.135.0 netmask 255.255.255.224 {
    option routers 10.89.135.1;
    range 10.89.135.2 10.89.135.26;
}
subnet 10.89.135.32 netmask 255.255.255.224 {
    option routers 10.89.135.33;
    range 10.89.135.34 10.89.135.58;
}
subnet 10.89.135.64 netmask 255.255.255.224 {
    option routers 10.89.135.65;
    range 10.89.135.66 10.89.135.80;
}
EOL

echo '> Configure the interface to bind the DHCP server to'
tee /etc/default/isc-dhcp-server>/dev/null <<EOL
INTERFACESv4="ens160"
EOL

# Restart ISC DHCPd
echo '> Restarting ISC DHCPd'
sudo service isc-dhcp-server restart

