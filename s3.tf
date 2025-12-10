# -----------------------
# S3 Bucket
# -----------------------
resource "aws_s3_bucket" "upload_bucket" {
  bucket = "lambda-upload-bucket-18102" # must be globally unique
}

# S3 bucket notification to trigger Lambda on object creation
resource "aws_s3_bucket_notification" "s3_notification" {
  bucket = aws_s3_bucket.upload_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_content_type_reader.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
