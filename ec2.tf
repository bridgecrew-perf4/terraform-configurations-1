resource "aws_instance" "jenkins_instance" { 
  ami = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public_subnet_primary.id
  vpc_security_group_ids = [aws_security_group.sg_ssh_http_allow.id]

  key_name = "macuartin_key_pair"

    tags = {
      Name = "${var.stack_id}-jks-instance"
    }
}
