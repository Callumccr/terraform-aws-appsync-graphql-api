resource "aws_appsync_graphql_api" "example_1" {
  count               = "${var.authentication_type == "API_KEY" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
}


resource "aws_appsync_graphql_api" "example_2" {
  count               = "${var.authentication_type == "AMAZON_COGNITO_USER_POOLS" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"

  user_pool_config {
    aws_region     = "${var.aws_region}"
    default_action = "${var.default_action}"
    user_pool_id   = "${var.user_pool_id}"
  }
}


resource "aws_appsync_graphql_api" "example_3" {
  count               = "${var.authentication_type == "AWS_IAM" ? 1 : 0}"
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  schema              = <<EOF
schema {
    query: Query
}
type Query {
  test: Int
}
EOF
}


resource "aws_appsync_graphql_api" "example_4" {
  count               = "${var.authentication_type == "OPENID_CONNECT" ? 1 : 0}"
  authentication_type = "${var.is_openid_connect}"
  name                = "${var.name}"

  openid_connect_config {
    issuer = "https://example.com"
  }
}
