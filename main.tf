resource "aws_appsync_graphql_api" "graphql_api" {
  authentication_type = var.authentication_type
  name                = var.name
  schema              = var.schema
  

  dynamic "openid_connect_config" {
    for_each = var.openid_connect_config
      content {
      issuer = openid_connect_config.value
    }
  }
  dynamic "user_pool_config" {
    for_each = var.user_pool_config 
      content {
        aws_region     = user_pool_config.value 
        default_action = user_pool_config.value 
        user_pool_id   = user_pool_config.value
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