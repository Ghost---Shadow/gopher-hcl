resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1ycabVohBK41 email@example.com"
}

resource "aws_instance" "nginx" {
  ami = "ami-379fbd50"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
}

resource "aws_instance" "redis" {
  ami = "ami-aaf321c4"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
}
