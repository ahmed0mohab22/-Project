data "aws_ami" "amz_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "ec2-1" {
        ami           = data.aws_ami.amz_linux.id
        instance_type = "t2.micro"
        key_name = "mykey"
        subnet_id = aws_subnet.public_subnets[0].id
        vpc_security_group_ids = [aws_security_group.sg.id]
        associate_public_ip_address = true


        tags = {
                Name = "Terraform Project"
        }
}

resource "aws_ebs_volume" "EBS" {
        size = 2
        availability_zone = aws_instance.ec2-1.availability_zone
        tags = {
                Name = "Terraform-project-ebs"
        }
}

resource "aws_volume_attachment" "ebs_attach" {
        device_name = "/dev/xvdb"
        volume_id = aws_ebs_volume.EBS.id
        instance_id = aws_instance.ec2-1.id
}