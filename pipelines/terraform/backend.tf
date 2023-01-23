terraform {
  backend "s3" {
    bucket = "xt-iac-tfstates"
    key    = "pipelines/terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
