resource "aws_s3_bucket" "s3_backend" {
  bucket = "test-bucket-tf-state"
  # acl    = "private"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  tags = {
    name = "test-tf-state-bucket"
  }

}


resource "aws_dynamodb_table" "tf-state-table" {
  name           = "test-dynamodb-tf-state-lock-table"
  hash_key       = "LockID"
  read_capacity  = "8"
  write_capacity = "8"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    name = "tf-state-lock-table"
  }

  depends_on = [aws_s3_bucket.s3_backend]
}


#  terraform {
#      backend "s3" {

#          bucket         = "test-bucket-tf-state"
#          key            = "terraform.tfstate"
#          region         = "us-east-2"
#          dynamodb_table = "test-dynamodb-tf-state-lock-table"
#          encrypt        = true
#      }
#  }
