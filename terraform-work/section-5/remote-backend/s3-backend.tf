terraform {
  backend "s3" {
    bucket = "dsp-terraform-remote-backend"
    key    = "team-A/dev.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
