ssh root@$1 "PATH_REDPITAYA=/opt/redpitaya /boot/sbin/rw && systemctl daemon-reload && systemctl stop redpitaya_scpi.service && systemctl stop redpitaya_nginx.service && systemctl stop seqpid_scpi.service"
ssh-copy-id -i ~/.ssh/id_rsa_rp.pub root@$1
scp /home/RP_ecosystem_build/RedPitaya/apiseq/lib/librpseq.so /home/RP_ecosystem_build/RedPitaya/apiseq/lib/librpseq.a root@$1:/opt/redpitaya/lib/
#scp /home/RP_ecosystem_build/RedPitaya/apiseq/include/redpitaya/rpseq.h root@$1:/opt/redpitaya/include/redpitaya/
scp /home/RP_ecosystem_build/RedPitaya/scpi-server-seqpid/scpi-server-seqpid root@$1:/opt/redpitaya/bin/
scp /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid/fpga_seqpid.bit root@$1:/opt/redpitaya/fpga/
scp /media/sf_XilinxUbuntuVMShare/RP_SeqPID/rp_seqpid_src/seqpid_scpi.service root@$1:/etc/systemd/system/
ssh root@$1 "systemctl daemon-reload && systemctl disable redpitaya_scpi.service  && systemctl disable redpitaya_nginx.service && systemctl enable seqpid_scpi.service && systemctl start seqpid_scpi.service"
#ssh root@$1 "systemctl start seqpid_scpi.service"
