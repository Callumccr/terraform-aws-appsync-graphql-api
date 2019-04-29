resource "aws_appsync_graphql_api" "example_1" {
  count               = "${var.is_api_key ? 1 : 0}"
  authentication_type = "${var.is_api_key}"
  name                = "${var.name}"
  api_id              = "${var.api_id}"
  expires             = "${var.expires}"
}


resource "aws_appsync_graphql_api" "example_2" {
  count               = "${var.is_amazon_cognito_user_pools ? 1 : 0}"
  authentication_type = "${var.is_amazon_cognito_user_pools}"
  name                = "${var.name}"

  user_pool_config {
    aws_region     = "${var.aws_region}"
    default_action = "${var.default_action}"
    user_pool_id   = "${var.user_pool_id}"
  }
}


resource "aws_appsync_graphql_api" "example_3" {
  count               = "${var.is_aws_iam ? 1 : 0}"
  authentication_type = "${var.is_aws_iam}"
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
  count               = "${var.is_openid_connect ? 1 : 0}"
  authentication_type = "${var.is_openid_connect}"
  name                = "${var.name}"

  openid_connect_config {
    issuer = "https://example.com"
  }
}
