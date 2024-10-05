resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.vpc.id
        tags = {
                Name = "terrform-vpc-igw"
        }
}

resource "aws_route_table" "second-rt" {
        vpc_id = aws_vpc.vpc.id
        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = aws_internet_gateway.igw.id
        }

        tags = {
                Name = "Public-route-table"
        }
}

resource "aws_route_table_association" "public-subnets-asso" {
        count = length(var.public_subnet_cidrs)
        subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
        route_table_id = aws_route_table.second-rt.id
}