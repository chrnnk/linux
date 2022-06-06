# on windows first run
ssh-keygen -t ed25519
type .ssh\id_ed25519.pub | ssh -p 20022 root@10.10.10.10 "cat >> .ssh/authorized_keys"
