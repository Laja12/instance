provider "aws" {
  region = "ap-southeast-2"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0013d898808600c4a"
  instance_type = "t2.micro"               # Replace with your desired instance type

  user_data =  <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>Welcome to My EC2 Instance ${count.index + 1}!</h1><p>Your custom message goes here.</p></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }
}
