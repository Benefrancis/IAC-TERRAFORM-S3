terraform {
  backend "s3" {
    bucket = "benefrancis-terraform"
    key    = "prod/terraform.tfstate"
    region = "us-west-1"
  }
}
