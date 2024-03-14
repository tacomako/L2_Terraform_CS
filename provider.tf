terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = "C:/Users/denis/Documents/Sheridan/2024/Cloud Systems/creds.txt"
}
