variable "aws_azs" {
        type = list(string)
        default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
        type        = list(string)
        description = "Public Subnet CIDR values"
        default     = ["192.168.1.0/24", "192.168.2.0/24"]
}

resource "aws_subnet" "public_subnets" {
        count = length(var.public_subnet_cidrs)
        vpc_id = aws_vpc.vpc.id
        availability_zone = element(var.aws_azs, count.index)
        cidr_block = element(var.public_subnet_cidrs, count.index)

        tags = {
                Name = "public_subnet- ${count.index + 1}"
        }
}

variable "private_subnet_cidrs" {
        type = list(string)
        description = "Private subnet CIDR values"
        default = ["192.168.3.0/24", "192.168.4.0/24"]
}

resource "aws_subnet" "private_subnets" {
        count = length(var.private_subnet_cidrs)
        vpc_id = aws_vpc.vpc.id
        availability_zone = element(var.aws_azs, count.index)
        cidr_block = element(var.private_subnet_cidrs, count.index)

        tags = {
                Name = "private-subnet- ${count.index + 1}"
        }
}