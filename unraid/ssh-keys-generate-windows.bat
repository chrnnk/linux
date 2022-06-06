# on windows first run
ssh-keygen -t ed25519
type .ssh\id_ed25519.pub | ssh -p PORT root@SERVERIP "cat >> .ssh/authorized_keys"
