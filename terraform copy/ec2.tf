resource "aws_key_pair" "rsantomauro" {
  key_name   = "rsantomauro"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDgj3RhN7bskEMjC/Cks4AuJN7z65jnu2CU/uBlj9tbHgh+F9bZ6lp5ksQh1uweG7UGEIaqsQfT+V8SouGT/uCURopwb4501BTGQzFLlg23GwOuiOWs8qZdMlysDdStwjYpRruzUPX37Z0wq4MGZf3wm3Y0T33cOwMvcNc8snp24GKuX3teP5lis2s4S3QZp9FcOoZJz25/ksfhLn9JG9X3SCCxSAHTz4OfXGE7Nyb9uoqYWLIwmWMiUccyYmTwdNi5gIHC//e4L/z67RwM7khi0ZsWyvxn6xu/RtpH00IzJuFlUN151gPOnQMmfs/TZk4SMXbN6nfapgd0p3682Zadb2tHYg+8uhP129NCrhv5+uJxEi12qumSjslvl1pUjQ5FzGGFmV9ffaj6a3rpu5g0TwPDs9dpEOPcZ3O/BTgV+GD3Lh9+eBsdksQNChsnxq2sqv2NdT5ezx1R+5+Nb7wbYyZgSbtgg5nHY9OKy2vEp/lZzTiUlEDf+wqQvTQ7wc="

  tags = {
    Terraform = "true"
  }
}

resource "aws_instance" "StoreWordpress" {
  ami               = "${var.ami}"
  instance_type     = "t2.micro"
  key_name          = "rsantomauro"
  monitoring        = true
  security_groups   = [aws_security_group.sg_store_dmz.id]
  subnet_id         = aws_subnet.dmz_private_subnet.id
  associate_public_ip_address = "true"

  tags = {
    Name        = "StoreWordpress"
    Terraform   = "true"
    Environment = "Prod"
  }
}

resource "aws_instance" "BDWordpress" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "rsantomauro"
  monitoring             = true
  security_groups        = [aws_security_group.sg_store_bd.id]
  subnet_id              = aws_subnet.bd_private_subnet.id

  tags = {
    Name        = "BDWordpress"
    Terraform   = "true"
    Environment = "Prod"
  }
}

resource "aws_instance" "GestionStore" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "rsantomauro"
  monitoring             = true
  security_groups        = [aws_security_group.sg_store_gestion.id]
  subnet_id              = aws_subnet.gestion_private_subnet.id
  associate_public_ip_address = "true"

  tags = {
    Name        = "GestionStore"
    Terraform   = "true"
    Environment = "Prod"
  }
}

resource "aws_instance" "SiemStore" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "rsantomauro"
  monitoring             = true
  security_groups        = [aws_security_group.sg_store_gestion.id]
  subnet_id              = aws_subnet.siem_private_subnet.id
  associate_public_ip_address = "true"

  tags = {
    Name        = "GestionStore"
    Terraform   = "true"
    Environment = "Prod"
  }
}