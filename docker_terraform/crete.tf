resource "aws_elasticache_parameter_group" "portfolio-parameter-group" {
  name   = "portfolio-parameter-group"
  family = "redis6.x"

  parameter {
    name  = "cluster-enabled"
    value = "no"
  }
}

resource "aws_elasticache_subnet_group" "portfolio-subnet-group" {
  name       = "portfolio-subnet-group"
  subnet_ids = [aws_subnet.portfolio-private-subnet-1.id, aws_subnet.portfolio-private-subnet-2.id]
}

resource "aws_elasticache_replication_group" "portfolio-replication-group" {
  replication_group_id          = "portfolio-replication-group"
  replication_group_description = "Cluster Disabled"
  engine                        = "redis"
  engine_version                = "6.x"
  number_cache_clusters         = 2
  node_type                     = "cache.t2.micro"
  maintenance_window            = "mon:01:40-mon:02:40"
  automatic_failover_enabled    = true
  port                          = 6379
  apply_immediately             = true
  security_group_ids            = [module.redis_sg.security_group_id]
  parameter_group_name          = aws_elasticache_parameter_group.portfolio-parameter-group.name
  subnet_group_name             = aws_elasticache_subnet_group.portfolio-subnet-group.name
}

module "redis_sg" {
  source      = "./security_group"
  name        = "redis-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 6379
  cidr_blocks = [aws_vpc.portfolio-vpc.cidr_block]
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

  security_group_ids  = [module.http_sg.security_group_id, module.https_sg.security_group_id, module.stmp_sg.security_group_id]
  subnet_ids          = [aws_subnet.portfolio-private-subnet-1.id]
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
