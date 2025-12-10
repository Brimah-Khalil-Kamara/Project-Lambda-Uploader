output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "lambda_function_name" {
  value = aws_lambda_function.s3_content_type_reader.function_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.upload_bucket.bucket
}
