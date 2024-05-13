ssh root@$1 "PATH_REDPITAYA=/opt/redpitaya /boot/sbin/rw"
ssh-copy-id -i ~/.ssh/id_rsa_rp.pub root@$1
ssh root@$1 "systemctl stop seqpid_scpi.service && systemctl disable seqpid_scpi.service && systemctl enable redpitaya_nginx.service && systemctl start redpitaya_nginx.service && rm /etc/systemd/system/seqpid_scpi.service && rm /opt/redpitaya/fpga/fpga_seqpid.bit && rm /opt/redpitaya/bin/scpi-server-seqpid  && rm /opt/redpitaya/lib/{librpseq.a,librpseq.so}"
