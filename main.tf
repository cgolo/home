provider "aws" {
  region = "us-east-2"
}

data "aws_region" "current" {}

resource "aws_dynamodb_table" "test_table_a" {
  name         = "test_table_a"
  billing_mode = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled         = true
    kms_master_key_id = "alias/aws/dynamodb"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name        = "test_table_a"
    Environment = "production"
  }

  lifecycle {
    prevent_destroy = true
  }
deletion_protection_enabled = true
}

resource "aws_lambda_function" "myfunction" {
tracing_config {
mode = "Active"
}
}

resource "aws_appsync_graphql_api" "test_api" {
  authentication_type = "API_KEY"
xray_enabled = true
}

resource "aws_keyspaces_table" "mykeyspacestable" {
encryption_specification {
type = "AWS_OWNED_KMS_KEY"
}
}