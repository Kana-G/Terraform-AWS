resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.default.id
  tags   = merge(var.tags, {})

  route {
    gateway_id = aws_internet_gateway.internet_gw.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id      = aws_subnet.snet-1b.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_subnet" "snet-1a" {
  vpc_id                  = aws_vpc.default.id
  tags                    = merge(var.tags, {})
  map_public_ip_on_launch = true
  cidr_block              = var.subnets[0]
  availability_zone       = "us-east-1a"
}

resource "aws_security_group_rule" "sg_rule" {
  type              = "ingress"
  to_port           = 443
  security_group_id = aws_security_group.sg.id
  protocol          = "tcp"
  from_port         = 443
  description       = "Allow workstation to communicate with the cluster API Server"

  cidr_blocks = [
    var.workstation-external-cidr,
  ]
}

resource "aws_subnet" "snet-1b" {
  vpc_id                  = aws_vpc.default.id
  tags                    = merge(var.tags, {})
  map_public_ip_on_launch = true
  cidr_block              = var.subnets[1]
  availability_zone       = "us-east-1b"
}

resource "aws_route_table_association" "rt_association2" {
  subnet_id      = aws_subnet.snet-1a.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.default.id
  tags   = merge(var.tags, {})
}

resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.default.id
  tags        = merge(var.tags, {})
  name        = var.sg_name
  description = "Cluster communication with worker nodes"

  egress {
    to_port   = 0
    protocol  = "-1"
    from_port = 0
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_vpc" "default" {
  tags                             = merge(var.tags, {})
  enable_dns_support               = true
  enable_dns_hostnames             = true
  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = true
}

