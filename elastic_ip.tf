resource "aws_eip" "jenkins_instance_eip" {
  instance = aws_instance.jenkins_instance.id
  vpc      = true

  tags = {
    Name = "${var.stack_id}-jks-eip"
  }

}
