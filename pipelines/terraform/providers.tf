provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      System         = "msql-pipeline"
      Env            = "dev"
      CreationOrigin = "terraform"
      Repository     = ""
      Documentation  = ""
    }
  }
}
