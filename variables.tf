# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-APPSYNC-GRAPHQL-API
# -----------------------------------------------------------------------------


variable "authentication_type" {
  type        = "string"
  description = "The authentication type. Valid values: API_KEY, AWS_IAM, AMAZON_COGNITO_USER_POOLS, OPENID_CONNECT (required)"
}

variable "graphqlapi_name" {
  type        = "string"
  description = "A user-supplied name for the GraphqlApi"
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

variable "schema_dir" {
  type        = "string"
  description = "The schema definition, in GraphQL schema language format"
  default     = ""
}

##Variable for log_config ()

variable "cloudwatch_logs_role_arn" {
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
  default     = "ALLOW"
}

variable "user_pool_id" {
  type        = "string"
  description = "The user pool id (Required)"
}

variable "app_id_client_regex" {
  type        = "string"
  description = "A regular exprecion for validating the incoming Amazon Cognito User Pool app client ID"
  default     = ""
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
