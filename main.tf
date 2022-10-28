resource "aws_s3_bucket" "ta_backend_bucket" {
    bucket = "group-3-talent-academy-elk-project"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "group-3-talent-academy-elk-project"
        Environment = "Test"
        Team        = "Group3-ELK"
        Owner       = "Group3"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = "group-3-talent-academy-elk-project"

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}