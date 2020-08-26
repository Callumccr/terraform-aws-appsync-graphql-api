resource "aws_appsync_graphql_api" "api_key" {
  count               = var.authentication_type == "API_KEY" ? 1 : 0
  authentication_type = var.authentication_type
  name                = var.graphqlapi_name
  schema              = file("${path.module}/schema.graphql")
  log_config {
    cloudwatch_logs_role_arn = var.cloudwatch_logs_role_arn
    field_log_level          = var.field_log_level
    exclude_verbose_content  = var.exclude_verbose_content
  }
  dynamic "additional_authentication_provider" {
    for_each = length(list(var.additional_authentication_provider)) > 0 ? var.additional_authentication_provider : {}
    content {
      authentication_type = each.value.authentication_type
      user_pool_config {
        user_pool_id        = each.value.user_pool_config.user_pool_id
        app_id_client_regex = each.value.user_pool_config.app_id_client_regex
        aws_region          = var.aws_region
      }
    }
  }
  tags = module.label.tags
}
