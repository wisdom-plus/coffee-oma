resource "aws_db_parameter_group" "portfolio-db-parameter" { #DBパラメータグルーブの定義
  name   = "portfolio-db"
  family = "mysql8.0"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

resource "aws_db_option_group" "portfolio-db-option-group" { #DBオブショングループの定義
  name                 = "portfolio-db-option-group"
  engine_name          = "mysql"
  major_engine_version = "8.0"
}

resource "aws_db_subnet_group" "portfolio-db-subnet-group" { #DBサブネットグループの定義
  name       = "portfolio-db-subnet"
  subnet_ids = [aws_subnet.portfolio-private-subnet-1.id, aws_subnet.portfolio-private-subnet-2.id]
}

resource "aws_db_instance" "portfolio-db" { #DBインスタンスの定義
  identifier                 = "portfolio-db"
  engine                     = "mysql"
  engine_version             = "8.0"
  instance_class             = "db.t3.small"
  allocated_storage          = 20
  max_allocated_storage      = 100
  storage_type               = "gp2"
  storage_encrypted          = true
  username                   = "root"
  password                   = "VeryStrongPassword!" #パスワードがtfstateファイルに平文で書き込まれる
  publicly_accessible        = false
  backup_window              = "09:10-09:40"
  backup_retention_period    = 3
  maintenance_window         = "mon:10:10-mon:10:40"
  auto_minor_version_upgrade = false
  deletion_protection        = false
  skip_final_snapshot        = true
  port                       = 3306
  apply_immediately          = false
  vpc_security_group_ids     = [module.mysql_sg.security_group_id]
  parameter_group_name       = aws_db_parameter_group.portfolio-db-parameter.name
  option_group_name          = aws_db_option_group.portfolio-db-option-group.name
  db_subnet_group_name       = aws_db_subnet_group.portfolio-db-subnet-group.name

  lifecycle {
    ignore_changes = [password]
  }
}

module "mysql_sg" { #DBインスタンスのセキュリティグループの定義
  source      = "./security_group"
  name        = "mysql-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id
  port        = 3306
  cidr_blocks = [aws_vpc.portfolio-vpc.cidr_block]
}

