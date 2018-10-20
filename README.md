# nshimayangform

:Create & Download SSH Keypair on AWS Management Console

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
 -var "aws_access_key=access_key"  \  
 -var "aws_secret_key=secret_access_key" \  
 -var "dbuser=db_user" \  
 -var "dbpassword=db_password" \  
 -var "ssh_key_name=keypairname(Default:nshimayangform)"

:Apply Execution Plan

terraform apply \  
 -var "aws_access_key=access_key"  \  
 -var "aws_secret_key=secret_access_key" \  
 -var "dbuser=db_user" \  
 -var "dbpassword=db_password" \  
 -var "ssh_key_name=keypairname(Default:nshimayangform)"
