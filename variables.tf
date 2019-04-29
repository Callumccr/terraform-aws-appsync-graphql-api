##variable for Appsync Graphql Api

variable "authentication_type" {
  type        = "string"
  description = "The authentication type. Valid values: API_KEY, AWS_IAM, AMAZON_COGNITO_USER_POOLS, OPENID_CONNECT (required)"
  default     = ""
}

variable "name" {
  type        = "string"
  description = "A user-supplied name for the GraphqlApi"
  default     = ""
}

variable "log_config" {
  description = "Nested argument containing logging configuration. Defined below"
  default     = ""
}

variable "openid_connect_config" {
  type        = "string"
  description = "Nested argument containing OpenID conect configuration"
  default     = "" 
}

variable "user_pool_config" {
  type        = "string"
  description = "The Amazon Cognito User Pool Configuration"
  default     = ""
}

variable "schema" {
  type        = "string"
  description = "The schema definition, in GraphQL schema language format"
  default     = ""
}

##Variable for log_config ()

variable "cloudwatch_log_role_arn" {
  type        = "string"
  description = "Amazon Resource Name of the service role that AWS AppSync will assume to publish to Amazon CloudWatch logs in your account"
  default     = ""
}

variable "field_log_level" {
  type        = "string"
  description = "Field logging level. Valid value: ALL, ERROR, NONE"
  default     = "none"
}

##Variable openid_connect_config

variable "issuer" {
  type        = "string"
  description = "Issuer for the OpenID Connect configuration. The issuer returned by discovery MUST exactly match the value of iff in the ID Token"
  default     = ""
}

variable "auth_ttl" {
  description = "Number of millseconds a token is valid after being authenticated"
  default     = ""
}

variable "client_id" {
  type        = "string"
  description = " Client identifier of the Relying party at the OpenID identity provider. This identifier is typically obtained when the Relying party is registered with the OpenID identity provider. You can specify a regular expression so the AWS AppSync can validate against multiple client identifiers at a time."
  default     = ""
}

variable "iat_ttl" {
  type        = "string"
  description = "Number of milliseconds a token is valid after being issued to a user"
  default     = "" 
}

##Variable user_pool_config

variable "default_action" {
  type        = "string"
  description = "he action that you want your GraphQL API to take when a request that uses Amazon Cognito User Pool authentication doesn't match the Amazon Cognito User Pool configuration. Valid: ALLOW and DENY"
  default     = "deny"
}

variable "user_pool_id" {
  type        = "string"
  description = "The user pool id (Required)"
}

variable "app_id_client_regex"{
  type        = "string"
  description = "A regular exprecion for validating the incoming Amazon Cognito User Pool app client ID"
  default     = ""
}

variable "aws_region" {
  type        = "string"
  description = "The AWS region in which the user pool was created"
  default     = ""
}
