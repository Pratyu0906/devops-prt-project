provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_master" {
  ami           = "ami-0ff91eb5c6fe7cc86"
  key_name      = "prt"
  instance_type = "t3.micro"
  tags = { Name = "devops-master" }
}

resource "aws_instance" "devops_agent" {
  ami           = "ami-0ff91eb5c6fe7cc86"
  instance_type = "t3.micro"
  key_name      = "prt"
  tags = { Name = "devops-agent" }
}
