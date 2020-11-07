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

resource "aws_eip" "portfolio-EIP-1" { #EIPの定義
  vpc        = true
  depends_on = [aws_internet_gateway.portfolio-gateway]
}

resource "aws_eip" "portfolio-EIP-2" { #EIPの定義
  vpc        = true
  depends_on = [aws_internet_gateway.portfolio-gateway]
}

resource "aws_nat_gateway" "portfolio-nat-gateway-1" { #NATゲートウェイの定義
  allocation_id = aws_eip.portfolio-EIP-1.id
  subnet_id     = aws_subnet.portfolio-public-subnet-1.id
  depends_on    = [aws_internet_gateway.portfolio-gateway]
}

resource "aws_nat_gateway" "portfolio-nat-gateway-2" { #NATゲートウェイの定義
  allocation_id = aws_eip.portfolio-EIP-2.id
  subnet_id     = aws_subnet.portfolio-public-subnet-2.id
  depends_on    = [aws_internet_gateway.portfolio-gateway]
}

resource "aws_route" "private-route-1" { #プラベートのルートの定義
  route_table_id         = aws_route_table.private-route-table-1.id
  nat_gateway_id         = aws_nat_gateway.portfolio-nat-gateway-1.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "private-route-2" { #プラベートのルートの定義
  route_table_id         = aws_route_table.private-route-table-2.id
  nat_gateway_id         = aws_nat_gateway.portfolio-nat-gateway-2.id
  destination_cidr_block = "0.0.0.0/0"
}
