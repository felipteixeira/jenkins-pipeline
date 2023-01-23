module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name = "jenkins"

  ami       = data.aws_ami.amzn2_filter_ami.id
  user_data = data.template_file.user_data.rendered

  instance_type          = "t2.micro"
  monitoring             = false
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  associate_public_ip_address = true
  create_iam_instance_profile = true
}

resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = module.ec2_instance.iam_role_name
}


