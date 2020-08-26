# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-APPSYNC-GRAPHQL-API
# -----------------------------------------------------------------------------

output "id" {
  value       = aws_appsync_graphql_api.api_key.*.id
  description = "The API AWS ID"
}

output "arn" {
  value       = aws_appsync_graphql_api.api_key.*.arn
  description = "The API AWS ARN"
}

output "uris" {
  value       = aws_appsync_graphql_api.api_key.*.uris
  description = "Map of URIs associated with the API."
}
