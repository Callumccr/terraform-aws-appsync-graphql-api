resource "aws_appsync_graphql_api" "example_1" {
  count               = "${var.authentication_type == "API_KEY" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  schema              = "${var.schema}"        
  log_config       {
    cloudwatch_logs_role_arn  = "${var.cloudwatch_logs_role_arn}"
    field_log_level          = "${var.field_log_level}"
  }
}


resource "aws_appsync_graphql_api" "example_2" {
  count               = "${var.authentication_type == "AMAZON_COGNITO_USER_POOLS" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  schema              = "${var.schema}"
  user_pool_config {
    aws_region     = "${var.aws_region}"
    default_action = "${var.default_action}"
    user_pool_id   = "${var.user_pool_id}"
  }
  log_config       {
    cloudwatch_logs_role_arn  = "${var.cloudwatch_logs_role_arn}"
    field_log_level          = "${var.field_log_level}"
  }
}


resource "aws_appsync_graphql_api" "example_3" {
  count               = "${var.authentication_type == "AWS_IAM" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  log_config       {
    cloudwatch_logs_role_arn  = "${var.cloudwatch_logs_role_arn}"
    field_log_level          = "${var.field_log_level}"
  }
  schema = "${var.schema}"        
}


resource "aws_appsync_graphql_api" "example_4" {
  count               = "${var.authentication_type == "OPENID_CONNECT" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  schema              = "${var.schema}"        
  log_config       {
    cloudwatch_logs_role_arn  = "${var.cloudwatch_logs_role_arn}"
    field_log_level          = "${var.field_log_level}"
  }
  openid_connect_config {
    issuer = "https://example.com"
  }
}
