#CREATES SECURITY GROUP
resource "aws_security_group" "allow_mongodb" {
  name        = "robot-${var.ENV}-mongodb-sg"
  description = "Allow MongoDB internal inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description      = "allow docdb from local network"
    from_port        = var.DOCDB_PORT
    to_port          = var.DOCDB_PORT
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  ingress {
    description      = "allow docdb from default network"
    from_port        = var.DOCDB_PORT
    to_port          = var.DOCDB_PORT
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "robot-${var.ENV}-mongodb-sg"
  }
}