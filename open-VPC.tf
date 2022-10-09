//VPC
resource "aws_vpc" "open_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true # DNS解決を有効化
  enable_dns_hostnames = true # DNSホスト名を有効化

  tags = {
    Name = "open-vpc"
  }
}

//Subnet
resource "aws_subnet" "open_public_1a" {
  vpc_id                  = aws_vpc.open_vpc.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "open-public-subnet-1a"
  }
}
resource "aws_subnet" "open_public_1c" {
  vpc_id                  = aws_vpc.open_vpc.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "open-public-subnet-1c"
  }
}
resource "aws_subnet" "open_public_1d" {
  vpc_id                  = aws_vpc.open_vpc.id
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "open-public-subnet-1d"
  }
}

resource "aws_subnet" "open_private_1a" {
  vpc_id            = aws_vpc.open_vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "open-private-subnet-1a"
  }
}
resource "aws_subnet" "open_private_1c" {
  vpc_id            = aws_vpc.open_vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "open-private-subnet-1c"
  }
}
resource "aws_subnet" "open_private_1d" {
  vpc_id            = aws_vpc.open_vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "open-private-subnet-1d"
  }
}

//Internet Gateway
resource "aws_internet_gateway" "open_internet_gateway" {
  vpc_id = aws_vpc.open_vpc.id

  tags = {
    Name = "open-internet-gateway"
  }
}

//Route Table
resource "aws_route_table" "open_public_route_table" {
  vpc_id = aws_vpc.open_vpc.id

  tags = {
    Name = "open-public-route-table"
  }
}

resource "aws_route" "open_public_route_internetgw" {
  gateway_id             = aws_internet_gateway.open_internet_gateway.id
  route_table_id         = aws_route_table.open_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "open_public_route_table_1a_assoc" {
  subnet_id      = aws_subnet.open_public_1a.id
  route_table_id = aws_route_table.open_public_route_table.id
}

resource "aws_route_table_association" "open_public_route_table_1c_assoc" {
  subnet_id      = aws_subnet.open_public_1c.id
  route_table_id = aws_route_table.open_public_route_table.id
}

resource "aws_route_table_association" "open_public_route_table_1d_assoc" {
  subnet_id      = aws_subnet.open_public_1d.id
  route_table_id = aws_route_table.open_public_route_table.id
}

//EIP
resource "aws_eip" "open_nat_gateway_eip_1a" {
  tags = {
    Name = "open-nat-gateway-eip-1a"
  }
}
/*
//Nat Gateway(本番環境であれば冗長化しRouteTableも合わせて変更必須)
resource "aws_nat_gateway" "open_nat_gateway_1a" {
  subnet_id     = aws_subnet.open_private_1a.id
  allocation_id = aws_eip.open_nat_gateway_eip_1a.id

  tags = {
    Name = "open-nat-gateway-1a"
  }

  depends_on = [aws_internet_gateway.open_internet_gateway]
}

//Route Table
resource "aws_route_table" "open_private_route_table" {
  vpc_id = aws_vpc.open_vpc.id

  tags = {
    Name = "open-private-route-table"
  }
}

resource "aws_route" "open_private_route_natgw" {
  gateway_id             = aws_nat_gateway.open_nat_gateway_1a.id
  route_table_id         = aws_route_table.open_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "open_private_route_table_1a_assoc" {
  subnet_id      = aws_subnet.open_private_1a.id
  route_table_id = aws_route_table.open_private_route_table.id
}

resource "aws_route_table_association" "open_private_route_table_1c_assoc" {
  subnet_id      = aws_subnet.open_private_1c.id
  route_table_id = aws_route_table.open_private_route_table.id
}

resource "aws_route_table_association" "open_private_route_table_1d_assoc" {
  subnet_id      = aws_subnet.open_private_1d.id
  route_table_id = aws_route_table.open_private_route_table.id
}
*/