resource "aws_ssm_parameter" "vpc" {
  type  = "String"
  name  = format("/%s/vpc/id", var.project_name)
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "public_subnets" {
  count = length(aws_subnet.public_subnets)
  type  = "String"
  name  = format("/%s/subnets/public/%s/%s", var.project_name, var.public_subnets[count.index].availability_zone, var.public_subnets[count.index].name)
  value = aws_subnet.public_subnets[count.index].id
}

resource "aws_ssm_parameter" "private_subnets" {
  count = length(aws_subnet.private_subnets)
  type  = "String"
  name  = format("/%s/subnets/private/%s/%s", var.project_name, var.private_subnets[count.index].availability_zone, var.private_subnets[count.index].name)
  value = aws_subnet.private_subnets[count.index].id
}

resource "aws_ssm_parameter" "database_subnets" {
  count = length(aws_subnet.database_subnets)
  type  = "String"
  name  = format("/%s/subnets/database/%s/%s", var.project_name, var.database_subnets[count.index].availability_zone, var.database_subnets[count.index].name)
  value = aws_subnet.database_subnets[count.index].id
}