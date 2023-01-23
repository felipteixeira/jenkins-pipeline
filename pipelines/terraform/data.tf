#Filter Amazon Linux 2.
data "aws_ami" "amzn2_filter_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

data "template_file" "user_data" {
  template = file("./.userdata/default_userdata.tpl")
}

data "aws_availability_zones" "available" {
  state = "available"
}
