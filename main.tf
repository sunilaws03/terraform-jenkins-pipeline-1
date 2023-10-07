 resource "aws_instance" "test" {
     ami = "ami-036f5574583e16426"
     availability_zone = "us-east-1"
     instance_type = "t2.micro"
 }
