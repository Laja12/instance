provider "aws" {
  region = "ap-southeast-2"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0013d898808600c4a"
  instance_type = "t2.micro"               # Replace with your desired instance type

  user_data = <<-EOF
              #!/bin/bash
              echo "Welcome to EC2 Instance ${count.index + 1}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }
}
