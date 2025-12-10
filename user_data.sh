#!/bin/bash
# ---------------------------
# user_data.sh for EC2
# ---------------------------

# Update packages
yum update -y

# Install Python3 and pip
yum install -y python3 python3-pip unzip

# Install Flask and Boto3
pip3 install --upgrade pip
pip3 install flask boto3

# Create app directory
mkdir -p /home/ec2-user/myflaskapp
cd /home/ec2-user/myflaskapp

# Create templates directory for HTML
mkdir -p templates

# Create the Flask app (app.py)
cat << 'EOF' > /home/ec2-user/myflaskapp/app.py
from flask import Flask, render_template, request
import boto3
import os

app = Flask(__name__)
s3_client = boto3.client('s3')

BUCKET_NAME = os.environ.get('S3_BUCKET_NAME', 'lambda-upload-bucket-18102')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    if file:
        # Upload with correct Content-Type
        s3_client.upload_fileobj(
            Fileobj=file,
            Bucket=BUCKET_NAME,
            Key=file.filename,
            ExtraArgs={'ContentType': file.content_type}  # <-- sets MIME type correctly
        )
        return f'Uploaded {file.filename} to S3 with content type {file.content_type}!'
    return 'No file uploaded.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Create the HTML form (templates/index.html)
cat << 'EOF' > /home/ec2-user/myflaskapp/templates/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Upload File to S3</title>
</head>
<body>
    <h1>Upload File to S3</h1>
    <form action="/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="Upload">
    </form>
</body>
</html>
EOF

# Change ownership to ec2-user
chown -R ec2-user:ec2-user /home/ec2-user/myflaskapp

# Start the Flask app using nohup so it runs in the background
nohup python3 /home/ec2-user/myflaskapp/app.py > /home/ec2-user/flask.log 2>&1 &
