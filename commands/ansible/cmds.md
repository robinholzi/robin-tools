Ansible
make -C cloud/dev ssm_forward LOCAL=9922 REMOTE=22
make deploy TARGET=aws ANSIBLE_FLAGS="-e ansible_port=9922"
