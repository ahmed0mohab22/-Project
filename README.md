# -Project
The Project automates AWS infrastructure setup using Terraform. It creates a VPC, security group, AMI, EBS volume, and EC2 instance ensuring consistency and reducing manual errors. 
![1_1RaRh7U8bum2D7-wskNu6g](https://github.com/user-attachments/assets/1ae959bc-ab06-4843-ae75-13841e61edc9)
## VPC Creation:

We define the VPC configuration, including CIDR block. This lays the foundation for our network architecture, providing isolated and secure communication within the AWS environment.
## Subnets Creation:

 we define the subnet configuration which include both public subnets and private subnets.

## Creating Internet-Gateway & Route-table:

we create Internet-Gateway for our public subnet that will connect us to internet. For this we also need to create routing table to create routes.

![image](https://github.com/user-attachments/assets/625741d3-3a32-422a-95bb-e7f2504156ba)

## Security Group Configuration:

We specify security group rules to control inbound and outbound traffic to our EC2 instances. This granular control enhances network security by restricting access based on predefined rulesets, thereby mitigating potential security vulnerabilities.


![image](https://github.com/user-attachments/assets/88f67d2e-4080-4a26-9733-c92381712607)

## EC2 Instance 

We define the EC2 instance configuration, including instance type, key pair, security group. Terraform provisions the EC2 instance within the VPC, ensuring connectivity and resource isolation while adhering to specified configurations.

![image](https://github.com/user-attachments/assets/aaf87234-68cf-4b6e-90d3-5d541de997df)

## EBS Volume Creation:

We provision an additional EBS volume apart from root volume using Terraform to augment the storage capacity of our EC2 instance. By specifying volume size, type, and attachment details, we seamlessly integrate the EBS volume into our infrastructure stack, ready for use by our applications, that will keep our data safe as even if we detach this volume, the data inside it remains same.
Attach this newly created ebs volume with our ec2 instance.

## Output Public IP Address:

Finally, we use Terraform’s output functionality to display the public IP address of the provisioned EC2 instance. This enables easy access and management of the instance for administrators and end-users alike.
![image](https://github.com/user-attachments/assets/26643cc7-3f54-41f9-8c1c-2561427bc408)


## Ansible Configuration Management:

Once the infrastructure is provisioned, we seamlessly transition to Ansible for configuration management tasks within the provisioned instances. Ansible empowers us to automate complex configuration tasks using idempotent playbooks and modules, facilitating efficient and scalable infrastructure management.

Our project seamlessly integrates Terraform and Ansible to create a cohesive deployment pipeline. While Terraform lays the foundation for the infrastructure stack, Ansible takes charge of configuring the provisioned instances, ensuring that they are fully functional and optimized for their intended purposes.
![image](https://github.com/user-attachments/assets/b7a986c1-c956-417d-a8f3-eacb8623fa95)

![image](https://github.com/user-attachments/assets/320cc7a2-5ed0-43f3-96a0-0389e70db8f9)
