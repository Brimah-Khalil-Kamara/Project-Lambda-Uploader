# -----------------------
# KEY PAIR RESOURCE
# -----------------------

resource "aws_key_pair" "ssh-key"{                          
    key_name      = var.ec2_key_name
    public_key = file(var.public_key_location)              
}

