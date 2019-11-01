resource "aws_appsync_graphql_api" "graphql_api" {
  authentication_type = var.authentication_type
  name                = var.name
  schema              = var.schema
  

  dynamic "openid_connect_config" {
    for_each = var.openid_connect_config
      content {
      issuer = openid_connect_config.value
      iat_ttl = var.iat_ttl
      client_id = openid_connect_config.value
      auth_ttl = var.auth_ttl
    }
  }
  dynamic "user_pool_config" {
    for_each = var.user_pool_config 
      content {
        user_pool_id   = user_pool_config.value.user_pool_id
        default_action = var.default_action
      }
  }
  dynamic "log_config" {
    for_each = var.log_config
      content {
        cloudwatch_logs_role_arn = lookup(log_config.value,"cloudwatch_logs_role_arn",null)
        field_log_level          = lookup(log_config.value,"field_log_level",null)
      }
  }
}
