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

resource "aws_subnet" "portfolio-public-subnet-2" { #パブリックサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1c"
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

resource "aws_route_table_association" "public-table-association-2" { #ルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_subnet" "portfolio-private-subnet-1" { #プライベートサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}

resource "aws_subnet" "portfolio-private-subnet-2" { #プライベートサブネットの定義
  vpc_id                  = aws_vpc.portfolio-vpc.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false
}


resource "aws_route_table" "private-route-table-1" { #プライベートルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}

resource "aws_route_table" "private-route-table-2" { #プライベートルートテーブルの定義
  vpc_id = aws_vpc.portfolio-vpc.id
}


resource "aws_route_table_association" "private-table-association-1" { #プライベートルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-private-subnet-1.id
  route_table_id = aws_route_table.private-route-table-1.id
}

resource "aws_route_table_association" "private-table-association-2" { #プライベートルートテーブルの関連付け
  subnet_id      = aws_subnet.portfolio-private-subnet-2.id
  route_table_id = aws_route_table.private-route-table-2.id
}



resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.portfolio-vpc.id
  service_name      = data.aws_vpc_endpoint_service.s3.service_name
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.private-route-table-1.id
}

data "aws_vpc_endpoint_service" "s3" {
  service      = "s3"
  service_type = "Gateway"
}

resource "aws_vpc_endpoint" "dkr" {
  vpc_id            = aws_vpc.portfolio-vpc.id
  service_name      = data.aws_vpc_endpoint_service.dkr.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [module.http_sg.security_group_id, module.https_sg.security_group_id]
  subnet_ids          = [aws_subnet.portfolio-private-subnet-1.id]
  private_dns_enabled = true
}

data "aws_vpc_endpoint_service" "dkr" {
  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr-api" {
  vpc_id            = aws_vpc.portfolio-vpc.id
  service_name      = data.aws_vpc_endpoint_service.ecr-api.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [module.http_sg.security_group_id, module.https_sg.security_group_id]
  subnet_ids          = [aws_subnet.portfolio-private-subnet-1.id]
  private_dns_enabled = true
}

data "aws_vpc_endpoint_service" "ecr-api" {
  service = "ecr.api"
}
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.portfolio-vpc.id
  service_name      = data.aws_vpc_endpoint_service.logs.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [module.http_sg.security_group_id, module.https_sg.security_group_id]
  subnet_ids          = [aws_subnet.portfolio-private-subnet-1.id]
  private_dns_enabled = true

}

data "aws_vpc_endpoint_service" "logs" {
  service = "logs"
}

resource "aws_vpc_endpoint" "email-smtp" {
  vpc_id            = aws_vpc.portfolio-vpc.id
  service_name      = data.aws_vpc_endpoint_service.email-smtp.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [module.http_sg.security_group_id, module.https_sg.security_group_id, module.stmp_sg.security_group_id]
  subnet_ids         = [aws_subnet.portfolio-private-subnet-1.id]
  private_dns_enabled = true
}

data "aws_vpc_endpoint_service" "email-smtp" {
  service = "email-smtp"
}

module "stmp_sg" {
  source      = "./security_group"
  name        = "stmp-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 587
  cidr_blocks = ["0.0.0.0/0"]
}

module "stmp_sg2" {
  source      = "./security_group"
  name        = "stmp-sg2"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 465
  cidr_blocks = ["0.0.0.0/0"]
}

