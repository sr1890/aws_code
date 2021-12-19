
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_instance" "neohome" {
  identifier                 = "neohome-${terraform.workspace}"
  allocated_storage          = 20
  storage_type               = "gp2"
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t2.micro"
  name                       = "neohome"
  username                   = var.db_username
  password                   = random_password.password.result
  parameter_group_name       = "default.mysql5.7"
  db_subnet_group_name       = aws_db_subnet_group.neohome.id
  auto_minor_version_upgrade = false
  skip_final_snapshot        = true
}

resource "aws_db_subnet_group" "neohome" {
  name       = "neohome-rds"
  subnet_ids = aws_subnet.private.*.id

  tags = {
    Name = "neohome RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow traffic for rds "
  vpc_id      = aws_vpc.my_app.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web_sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
