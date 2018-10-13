# nshimayangform
:Download Terraform(v0.11.8)
wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip -d /usr/local/bin

:Download Git Repository(nshimayangform)

git clone https://github.com/nshimayang/nshimayangform.git  
cd nshimayangform/

:Initial setting for Terraform

terraform init

:Check Execution Plan

terraform plan \  
 -var "aws_access_key=<access key>"  \  
 -var "aws_secret_key=<secret access key>" \  
 -var "dbuser=<db user>" \  
 -var "dbpassword=<db password>" 

:Apply Execution Plan

terraform apply \  
 -var "aws_access_key=<access key>"  \  
 -var "aws_secret_key=<secret access key>" \  
 -var "dbuser=<db user>" \  
 -var "dbpassword=<db password>" 
