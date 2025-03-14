provider "aws" {
  region = "ap-southeast-2"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0041fa54d2b785bb0"
  instance_type = "t2.micro"               # Replace with your desired instance type

  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }
}
