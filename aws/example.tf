provider "aws" {
  profile = "default" # "default" means "%UserProfile%\.aws\credential" in Windows
  region  = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a1c2ec61571737db" # amazon linux
  instance_type = "t2.micro"
  tags = {
    Name  = "terraform-test"
    Owner = "nisunisu"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
  tags = {
    Name  = "EIP_terraform_test"
    Owner = "nisunisu"
  }
  depends_on = [aws_instance.example]
}