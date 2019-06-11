## Usage

```hcl
#################################################
#######With Type AMAZON_COGNITO_USER_POOLS#######

module "graphql-api" {
  source                    = "./modules/tf-aws-appsync-graphql-api"
  authentication_type       = "${var.authentication_type}"
  name                      = "${var.name}"
  default_action            = "${var.default_action}"
  user_pool_id              = "${var.user_pool_id}"
  aws_region                = "${local.region}"
  schema                    = "${file("./templates/schema.graphql")}"
  cloudwatch_logs_role_arn  = "${aws_iam_role.appsync_datasource_role.arn}"
  field_log_level           = "${var.field_log_level}"
}

###############################
#######With Type API_KEY#######

module "graphql-api-api-key" {
  source                    = "./modules/tf-aws-appsync-graphql-api"
  authentication_type       = "${var.authentication_type}"
  name                      = "${var.name}"
  schema                    = "${var.schema}"        
  cloudwatch_logs_role_arn  = "${aws_iam_role.appsync_datasource_role.arn}"
  field_log_level           = "${var.field_log_level}"
}

###############################
#######With Type AWS_IAM#######

module "graphql-api-aws-iam" {
  source                   = "./modules/tf-aws-appsync-graphql-api"
  authentication_type      = "${var.authentication_type}"
  name                     = "${var.name}"
  cloudwatch_logs_role_arn = "${var.cloudwatch_logs_role_arn}"
  field_log_level          = "${var.field_log_level}"
  schema                   = "${var.schema}"        
}

######################################
#######With Type OPENID_CONNECT#######

module "graphql-api-openid-connect" {
  authentication_type = "${var.authentication_type}"
  name                = "${var.name}"
  schema              = "${var.schema}"        
  cloudwatch_logs_role_arn  = "${var.cloudwatch_logs_role_arn}"
  field_log_level          = "${var.field_log_level}"
  issuer = "https://example.com"
}

```
