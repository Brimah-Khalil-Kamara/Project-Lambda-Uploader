# IAM role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_upload_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}






# -----------------------
# EC2 Instance
# -----------------------
resource "aws_instance" "web" {
  ami           = "ami-0fa3fe0fa7920f68e" # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_sg.name]
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
  
  #user_data = file("user_data.sh")
  user_data = file("${path.module}/user_data.sh")


  tags = {
    Name = "lambda-web-server"
  }
}


