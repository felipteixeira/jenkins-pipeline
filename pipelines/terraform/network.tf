module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name            = "vpc-dev-default"
  cidr            = "10.2.0.0/16"
  azs             = data.aws_availability_zones.available.names
  public_subnets  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  private_subnets = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
  intra_subnets   = ["10.2.50.0/24", "10.2.51.0/24", "10.2.52.0/24"]

  enable_nat_gateway                   = true
  single_nat_gateway                   = true
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_flow_log                      = false
  create_flow_log_cloudwatch_iam_role  = false
  create_flow_log_cloudwatch_log_group = false
  one_nat_gateway_per_az               = false
}
