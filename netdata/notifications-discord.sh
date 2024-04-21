/etc/netdata/edit-config health_alarm_notify.conf
nano /etc/netdata/health_alarm_notify.conf
# SEND_DISCORD="YES"
# DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/your-discord-channel-webhook-url-goes-here"
# DEFAULT_RECIPIENT_DISCORD="discord-channel-name"
# role_recipients_discord[sysadmin]="systems"
# role_recipients_discord[domainadmin]="domains"
# role_recipients_discord[dba]="databases systems"
# role_recipients_discord[webmaster]="marketing development"
# role_recipients_discord[proxyadmin]="proxy-admin"
# role_recipients_discord[sitemgr]="sites"
/usr/libexec/netdata/plugins.d/alarm-notify.sh test
