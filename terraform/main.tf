resource "aws_instance" "k8s_master" {

 ami = "ami-0ff91eb5c6fe7cc86"
 instance_type = "t3.micro"

 tags = {
  Name = "k8s-control-plane"
 }

}
