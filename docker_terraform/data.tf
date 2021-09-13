data "aws_vpc" "portfolio-vpc" {
  id = "vpc-0fc20f95f258ff0cd"
}

data "aws_subnet" "portfolio-private-subnet-1" {
  id = "subnet-0947a9f50da0ef4ac"
}

data "aws_subnet" "portfolio-private-subnet-2" {
  id = "subnet-0c710e2aaa2e489d0"
}

data "aws_route_table" "private-route-table-1" {
  id = "rtb-0f68daccdc6abcf06"
}
