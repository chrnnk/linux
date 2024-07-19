apt install lsb-release -y
wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.8.1-1_amd64.deb
WAZUH_MANAGER='wazuh.home.chrnnk.tv' dpkg -i ./wazuh-agent_4.8.1-1_amd64.deb
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
