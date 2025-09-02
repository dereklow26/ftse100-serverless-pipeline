terraform {
  backend "s3" {
    bucket         = "YOUR-UNIQUE-TFSTATE-BUCKET-NAME"
    key            = "ftse100/terraform.tfstate"   # path (folder/file) inside the bucket
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
