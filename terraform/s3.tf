resource "aws_s3_bucket" "portfolio-private" {
  bucket = "coffee-oma-image-bucket"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio-private-access-block" {
  bucket                  = aws_s3_bucket.portfolio-private.id
  restrict_public_buckets = true
  block_public_policy     = true
}

resource "aws_s3_bucket_policy" "portfolio-bucket-policy" {
  bucket = aws_s3_bucket.portfolio-private.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

data "aws_iam_policy_document" "bucket_policy_document" {

  statement {
    sid    = "Stmt000001"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.s3-user.arn]
    }
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.portfolio-private.arn
    ]
  }
}

data "aws_iam_user" "s3-user" {
  user_name = "portfolio-s3"
}
