resource "aws_appsync_graphql_api" "api_key" {
  count               = var.authentication_type == "API_KEY" ? 1 : 0
  authentication_type = var.authentication_type
  name                = var.graphqlapi_name
  schema              = var.schema
  log_config {
    cloudwatch_logs_role_arn = var.cloudwatch_logs_role_arn
    field_log_level          = var.field_log_level
  }
  tags = module.label.tags
  dynamic "additional_authentication_provider" {
    for_each = length(var.additional_authentication_provider) > 0 ? var.additional_authentication_provider : []
    content {
      authentication_type   = each.value.authentication_type
      openid_connect_config = each.value.openid_connect_config
      user_pool_config      = each.value.user_pool_config
    }
  }
}
