resource "aws_vpc" "portfolio-vpc" { #vpcの定義
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "portfolio-vpc"
  }
}

resource "aws_subnet" "portfolio-public-subnet-1" { #パブリックサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}


resource "aws_internet_gateway" "portfolio-gateway" { #インターネットゲートウェイの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route_table" "public-route-table" { #パブリックルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route" "public-route" { #ルートの定義
  route_table_id         = aws_route_table.public-route-table.id
  gateway_id             = aws_internet_gateway.portfolio-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public-table-association-1" { #ルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_subnet" "portfolio-private-subnet-1" { #プライベートサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}


resource "aws_route_table" "private-route-table-1" { #プライベートルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}



resource "aws_route_table_association" "private-table-association-1" { #プライベートルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-private-subnet-1.id
  route_table_id = aws_route_table.private-route-table-1.id
}


resource "aws_eip" "portfolio-EIP-1" { #EIPの定義
  vpc        = true
  depends_on = [aws_internet_gateway.portfolio-gateway]
}


resource "aws_nat_gateway" "portfolio-nat-gateway-1" { #NATゲートウェイの定義
  allocation_id = aws_eip.portfolio-EIP-1.id
  subnet_id     = aws_subnet.portfolio-public-subnet-1.id
  depends_on    = [aws_internet_gateway.portfolio-gateway]
}


resource "aws_route" "private-route-1" { #プラベートのルートの定義
  route_table_id         = aws_route_table.private-route-table-1.id
  nat_gateway_id         = aws_nat_gateway.portfolio-nat-gateway-1.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.default.id
  service_name      = data.aws_vpc_endpoint_service.s3.service_name
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private.*.id, count.index)
}

data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "dkr" {
  vpc_id            = aws_vpc.default.id
  service_name      = data.aws_vpc_endpoint_service.dkr.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = var.ecr_dkr_endpoint_security_group_ids
  subnet_ids          = aws_subnet.private.*.id
  private_dns_enabled = true

  tags = var.tags
}

data "aws_vpc_endpoint_service" "dkr" {
  service = "ecr.dkr"
}
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.default.id
  service_name      = data.aws_vpc_endpoint_service.logs.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = var.logs_endpoint_security_group_ids
  subnet_ids          = aws_subnet.private.*.id
  private_dns_enabled = true

  tags = var.tags
}

data "aws_vpc_endpoint_service" "logs" {
  service = "logs"
}
