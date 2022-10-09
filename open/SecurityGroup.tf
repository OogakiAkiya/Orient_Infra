//Open public Gameserver inbound Security Group
resource "aws_security_group" "open_public_orient_inbound" {
  vpc_id = data.aws_vpc.open_vpc.id
  name   = "open-public-orient_inbound"

  tags = {
    Name = "open-public-orient_inbound"
  }
}

//Open public Outbound Security Group
resource "aws_security_group" "open_public_outboud" {
  vpc_id = data.aws_vpc.open_vpc.id
  name   = "open-public-outbound"

  tags = {
    Name = "open-public-outbound"
  }
}

#ゲームサーバー用のインバウンド作成
resource "aws_security_group_rule" "open_public_inbound_tcp_17600" {
  security_group_id = aws_security_group.open_public_orient_inbound.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 17600
  to_port           = 17600
  protocol          = "tcp"
}

resource "aws_security_group_rule" "open_public_inbound_udp_17700" {
  security_group_id = aws_security_group.open_public_orient_inbound.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 17700
  to_port           = 17700
  protocol          = "udp"
}



# アウトバウンドルール(全開放)
resource "aws_security_group_rule" "open_public_outboud_all" {
  security_group_id = aws_security_group.open_public_outboud.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
