provider "aws"{
  region = "us-east-1"
  assume_role { 
    role_arn = "arn:aws:iam::463912538787:role/crossaccountfor402"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
