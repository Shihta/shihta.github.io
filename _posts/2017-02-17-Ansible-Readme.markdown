---
layout     : post
title      : "Ansible Readme"
subtitle   : ""
date       : 2017-02-17 07:45:08
author     : "Shihta"
tags       : Ansible
comments   : true
---

# Ansible


## Commands
```
ansible ap-northeast-1a -i ec2.py -m raw -a "whoami" -u ubuntu --private-key=~/.ssh/md-production.pem

EC2_INI_PATH=./ec2.ini ansible ap-northeast-1a -i ec2.py -m raw -a "whoami" -u ubuntu --private-key=~/.ssh/md-production.pem

AWS_PROFILE=pi ./ec2.py --list
AWS_PROFILE=pi ansible ap-northeast-1a -i ec2.py -m raw -a "whoami" -u ubuntu --private-key=~/.ssh/pivue-key-0.pem

GCE_EMAIL=deploy@pivue0.iam.gserviceaccount.com GCE_PROJECT=pivue0 GCE_CREDENTIALS_FILE_PATH=~/.gcp/pivue0-xxxx.json ./gce.py

$ ./azure_rm.py |python -m json.tool
```

## Commands - Playbook
```
AWS_PROFILE=pi ansible-playbook -i ec2.py --private-key=~/.ssh/pivue-key-0.pem provision.yml

ansible-playbook -i ec2.py --private-key=~/.ssh/shihta-aws-k0.pem provision.yml --list-hosts --extra-vars "HOSTS=tag_Name_vtest_*"

REGISTRY_HOST=*** REGISTRY_USER=*** REGISTRY_PASS=*** ansible-playbook -i ec2.py --private-key=~/.ssh/shihta-aws-k0.pem qcmdc-vtest.yml

ansible-playbook -v -i ec2.py --private-key=~/.ssh/shihta-aws-k0.pem example_aws_gcp_select.yml

GCE_EMAIL=deploy@pivue0.iam.gserviceaccount.com GCE_PROJECT=pivue0 GCE_CREDENTIALS_FILE_PATH=~/.gcp/pivue0-xxxx.json ansible-playbook -v -i gce.py --private-key=~/.ssh/pivue-key-0.pem example_aws_gcp_select.yml --extra-vars="@rd.json"
```

## Azure
```
$ openssl x509 -in ./examplecert.pem -fingerprint -noout | sed 's/SHA1 Fingerprint=//g'  | sed 's/://g'
3781AD6DCAF2FE3A596079D5C9AF2FDE79A7AB36

azure ad sp create -n Iapp3 --cert-value `cat adspcreate`
info:    Executing command ad sp create
+ Creating application exampleapp3
+ Creating service principal for application d2ef0bdb-613f-4bce-99c3-4fa6cb7f9d08
data:    Object Id:               97ce22d2-bd1e-4c6a-9dbe-3fa64aed6688
data:    Display Name:            exampleapp3
data:    Service Principal Names:
data:                             d2ef0bdb-613f-4bce-99c3-4fa6cb7f9d08
data:                             http://exampleapp3
info:    ad sp create command OK

$ azure role assignment create --objectId 97ce22d2-bd1e-4c6a-9dbe-3fa64aed6688 -o Reader -c /subscriptions/fe2db209-68e2-4ab4-9067-78edf1d7f2be/
info:    Executing command role assignment create
+ Finding role with specified name
|data:    RoleAssignmentId     : /subscriptions/fe2db209-68e2-4ab4-9067-78edf1d7f2be/providers/Microsoft.Authorization/roleAssignments/9990a6fc-6dc9-4c76-a49d-4fd417b20c88
data:    RoleDefinitionName   : Reader
data:    RoleDefinitionId     : acdd72a7-3385-48ef-bd42-f606fba81ae7
data:    Scope                : /subscriptions/fe2db209-68e2-4ab4-9067-78edf1d7f2be
data:    Display Name         : exampleapp3
data:    SignInName           : undefined
data:    ObjectId             : 97ce22d2-bd1e-4c6a-9dbe-3fa64aed6688
data:    ObjectType           : ServicePrincipal
data:
+
info:    role assignment create command OK

azure ad sp show -c exampleapp3
info:    Executing command ad sp show
+ Getting Active Directory service principals
data:    Object Id:               97ce22d2-bd1e-4c6a-9dbe-3fa64aed6688
data:    Display Name:            exampleapp3
data:    Service Principal Names:
data:                             http://exampleapp3
data:                             d2ef0bdb-613f-4bce-99c3-4fa6cb7f9d08
data:
info:    ad sp show command OK

azure account show
info:    Executing command account show
data:    Name                        : Free Trial
data:    ID                          : fe2db209-68e2-4ab4-9067-78edf1d7f2be
data:    State                       : Enabled
data:    Tenant ID                   : bd60d722-e67d-410c-b03d-40e38ad29663
data:    Is Default                  : true
data:    Environment                 : AzureCloud
data:    Has Certificate             : No
data:    Has Access Token            : Yes
data:    User name                   : d2ef0bdb-613f-4bce-99c3-4fa6cb7f9d08
data:
info:    account show command OK

$ azure login --service-principal --tenant bd60d722-e67d-410c-b03d-40e38ad29663 -u d2ef0bdb-613f-4bce-99c3-4fa6cb7f9d08 --certificate-file ./workspace/ansible/azure/ssl/examplecert.pem --thumbprint 3781AD6DCAF2FE3A596079D5C9AF2FDE79A7AB36
info:    Executing command login
-info:    Added subscription Free Trial
+
info:    login command OK

$ azure ad sp set -o 97ce22d2-bd1e-4c6a-9dbe-3fa64aed6688 -p XXXXXXXX
```

## Notes
1. I directly copy some ec2.py, gce.py, ... from source instead of using soft
   link for avoiding wrong configure reference.

## Reference
1. [Ansible Documentation](http://docs.ansible.com/ansible/)
2. [Create service principal with certificate](https://docs.microsoft.com/zh-tw/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli)
3. [Install using official GitLab repositories](https://docs.gitlab.com/runner/install/linux-repository.html)
4. [Safely limiting Ansible playbooks to a single machine?](http://stackoverflow.com/questions/18195142/safely-limiting-ansible-playbooks-to-a-single-machine)

