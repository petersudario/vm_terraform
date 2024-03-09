resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm_aws" {
  ami                         = "ami-0a8227ca4bf7367c3"
  instance_type               = "t2.micro"
  availability_zone = "sa-east-1a"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.SUBNET_ID
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
  tags = {
    Name = "vm-aws"
  }
}