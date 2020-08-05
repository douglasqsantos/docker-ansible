# docker-ansible

Docker image to work with Ansible

## Building the image 

```bash
docker build -t douglasqsantos/ansible .
```

## Using the Image

Access the directory with the ansible files to work and start the image
```bash
docker run --rm -it -v "${PWD}:/ansible/workspace" -w /ansible douglasqsantos/ansible fish
```

After access the image import the virtualenv to use the ansible
```bash
source venv_ansible/bin/activate.fish
```

Now just check if the ansible is working
```bash
ansible --version
ansible 2.9.11      
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /ansible/venv/lib/python3.8/site-packages/ansible
  executable location = /ansible/venv/bin/ansible
  python version = 3.8.5 (default, Jul 20 2020, 23:11:29) [GCC 9.3.0]
```
