Created 2 EC2 instances , Web server in public subnet and dB server in private subnet 
Instance Web Server EC2- web-server 
Instance DB Server EC2- db-server 

The EC2 names are as above . All these through Terraforms 
I used ./terrform.exe for the terraform commands by copying the terraform.exe file inside the root but cannot commit 
it into the git repository as the file is around 80 MB. 

The terraform files both for root and module wise have been included 

I downloaded TravelMemory folder here only .

I choose to install Ansible in one of the EC2s ( web-server ), have included the screen sbots of successfull
installation . 

I have included the playbooks inside Ansible folder ( .yml files )

Unfortunately the MongoDb installation is taking too much time and I dont want to consume too many resources 
thats why could not have the website fully running but all security groups configuration done . 