provider "aws" {
  region = "ap-southeast-2"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  count         = 3
(*   ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID *)
  instance_type = "t2.micro"               # Replace with your desired instance type

  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }
}
