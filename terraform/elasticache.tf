resource "aws_elasticache_parameter_group" "portfolio-parameter-group" {
  nama = "portfolio-parameter-group"
  famiy = "redis5.0"

  parameter {
    name = "ckuster-enabled"
    value = "no"
  }
}

resource "aws_elasticache_subnet_group" "portfolio-subnet-group" {
  name = "portfolio-subnet-group"
  subnet_ids = [aws_subnet.portfolio-private-subnet-1.id, aws_subnet.portfolio-private-subnet-2.id]
}

resource "aws_elasticache_replication_group" "portfolio-replication-group" {
  replication_group_id = "portfolio-replication-group"
  replication_group_description = "Cluster Disabled"
  engine = "redis"
  engine_version = "5.0.4"
  number_cache_clusters = 0
  node_type = "cache.m2.micro"
  maintenance_window = "mon:1:40-mon:2:40"
  automatic_failover_enabled = true
  port = 6379
  apply_immediately = true
  security_group_ids = [module.redis_sg.security_group_id]
  parameter_group_name = aws_elasticache_parameter_group.portfolio-parameter-grop.names
  subnet_group_name = aws_elasticache_subnet_group.portfolio-subnet-group.name
}

module "redis_sg" {
  source = "./security_group"
  name = "redis-sg"
  vpc_id =  aws_vpc.portfolio-vpc.id
  port =6379
  cidr_blocks = [aws_vpc.portfolio-vpc.cidr_block]
}
