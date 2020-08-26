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

variable "enabled" {
  description = "(Optional) - A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "authentication_type" {
  type        = string
  description = "The authentication type. Valid values: API_KEY, AWS_IAM, AMAZON_COGNITO_USER_POOLS, OPENID_CONNECT (required)"
}

variable "graphqlapi_name" {
  type        = string
  description = "A user-supplied name for the GraphqlApi"
}

##Variable for log_config ()

variable "cloudwatch_logs_role_arn" {
  type        = string
  description = "Amazon Resource Name of the service role that AWS AppSync will assume to publish to Amazon CloudWatch logs in your account"
  default     = ""
}

variable "field_log_level" {
  type        = string
  description = "Field logging level. Valid value: ALL, ERROR, NONE"
  default     = "none"
}

variable "exclude_verbose_content" {
  type        = bool
  description = "(Optional) Set to TRUE to exclude sections that contain information such as headers, context, and evaluated mapping templates, regardless of logging level. Valid values: true, false. Default value: false"
  default     = false
}

##Variable user_pool_config

variable "additional_authentication_provider" {
  type = object({
    authentication_type = string
    user_pool_id        = string
    app_id_client_regex = string
  })
  description = "(Optional) One or more additional authentication providers for the GraphqlApi."
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
