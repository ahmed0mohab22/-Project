resource "aws_security_group" "sg" {
        name = "terraform_sg"
        description = "This security group is for terraform practice"
        vpc_id = aws_vpc.vpc.id

        tags = {
                Name = "terraform_vg"
        }
}

resource "aws_vpc_security_group_ingress_rule" "sg_in_rule" {
        security_group_id = aws_security_group.sg.id
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 80
        ip_protocol = "tcp"
        to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "sg_in_rule2" {
        security_group_id = aws_security_group.sg.id
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 22
        ip_protocol = "tcp"
        to_port = 22
}


resource "aws_vpc_security_group_egress_rule" "sg_eg_rule" {
        security_group_id = aws_security_group.sg.id
        cidr_ipv4         = "0.0.0.0/0"
        ip_protocol       = "-1" 
}