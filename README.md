# robin-backup

Raspberry Pi backup setup.

## Deploy via Ansible

```bash
# In a separate terminal, run all playbooks by connecting to localhost on a specific port.
make deploy TARGET=pi ANSIBLE_FLAGS="-e ansible_port=9922"
```

## Manage AWS Production Resources

We currently only manage a KMS key for SOPS in the production resources.
To modify it (should never be necessary), you can run the following.

```bash
cd cloud/prod
make apply
```

## Configuration

### SOPS

Secret management is done using SOPS. All secrets are stored in the [secrets/](./secrets) directory and can be accessed using, for example, the following commands from the `sops` CLI:

```shell
# Decrypt all secrets from file.
sops --decrypt ./secrets/aws-dev.sops.yaml
# Modify secrets file in-place.
sops ./secrets/aws-dev.sops.yaml
```
