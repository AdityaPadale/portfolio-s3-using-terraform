provider "aws" {
  region = "us-east-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = "adi-static-site-123"  # change name if already taken
}

# Enable public website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

# Disable ACL feature (required by AWS)
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Make bucket public using Policy only
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.mybucket.id

  depends_on = [
    aws_s3_bucket_ownership_controls.ownership
  ]

  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = "*"
          Action = [
            "s3:GetObject"
          ]
          Resource = "${aws_s3_bucket.mybucket.arn}/*"
        }
      ]
    }
  )
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

# Upload resume.pdf
resource "aws_s3_object" "resume" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "resume.pdf"
  source = "resume.pdf"
  content_type = "application/pdf"
}
# Upload adityap.jpg
resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "adityap.jpg"
  source = "adityap.jpg"
  content_type = "application/jpg"
}

output "website_url" {
  value = aws_s3_bucket.mybucket.website_endpoint
}
