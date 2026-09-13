#!/bin/sh

# Executables
semanage fcontext -a -t sesinetd_exec_t "/usr/lib/sesi/sesictrl"
semanage fcontext -a -t sesinetd_exec_t "/usr/lib/sesi/sesinetd"
semanage fcontext -a -t sesinetd_exec_t "/usr/lib/sesi/sesinetd_safe"
semanage fcontext -a -t hserver_exec_t "/usr/lib/sesi/hserver/hserver"

# Apply
restorecon -Rv "/usr/lib/sesi"

# SeLinux Policies
systemctl start sesinetd.service
ausearch -c 'sesinetd' --raw | audit2allow -M sesinetd_local
mv -f sesinetd_local.pp /usr/lib/sesi/sesinetd_local.pp
semodule -i /usr/lib/sesi/sesinetd_local.pp

# hserver
systemctl start hserver.service
ausearch -c 'hserver' --raw | audit2allow -M hserver_local
mv -f hserver_local.pp /usr/lib/sesi/hserver/hserver_local.pp
semodule -i /usr/lib/sesi/hserver/hserver_local.pp

# Services
systemctl daemon-reload
systemctl restart sesinetd.service
systemctl restart hserver.service

