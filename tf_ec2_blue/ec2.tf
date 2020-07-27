resource "aws_instance" "web_1" {
  ami           = "ami-0a1c2ec61571737db" # amazon linux
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.ec2_blue.id
  ]
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id_private_1c
  associate_public_ip_address = false # NOTICE: Even if this is set as "false", it will be ALWAYS set as "true" when "auto-assign public ipv4 address" with SUBNET is set as "TRUE".
  key_name                    = var.key_name
  tags = {
    Name  = "ec2_web_1_terraform_${terraform.workspace}"
  }
}
