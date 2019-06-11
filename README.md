
# tf-aws-appsync-graphql

Terraform module that creates AppSync-DataSource resources in AWS, of the following types:

* Api-Key
* Amazon-Cognito-User-Pools 
* Aws-Iam
* OpenID-Connect

## GraphQL

GraphQL is a data language that was developed to enable apps to fetch data from servers, In a GraphQL operation, the client specifies how to structure the data when it is returned by the server. This makes it possible for the client to query only for the data it needs, in the format that it needs it in.

## Schema

Each GraphQL API is defined by a single GraphQL scheme. The GraphQL type system describes the capabilities of a GraphQL server and is used to determine if a query is valid.
Define the form of the data that flows through your API and also the operations that can be performed.

## DataSource

Data sources are resources in your AWS account with which the GraphQL APIs can interact. AWS AppSync supports AWS Lambda, Amazon DynamoDB and Amazon Elasticsearch Service as data sources.
An AWS AppSync API can be configured to interact with multiple data sources, allowing you to aggregate data in a single location. AWS AppSync can use existing AWS resources in your account or you can provision DynamoDB tables in your name from a schema definition.

## Resolver

GraphQL resolvers connect the fields in a type's schema to a data source. Resolvers are the mechanism by which requests are fulfilled. AWS AppSync can automatically create and connect resolvers from a schema or create a schema and connect resolvers from an existing table without you needing to write any code.
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

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app\_id\_client\_regex | A regular exprecion for validating the incoming Amazon Cognito User Pool app client ID | string | `""` | no |
| auth\_ttl | Number of millseconds a token is valid after being authenticated | string | `""` | no |
| authentication\_type | The authentication type. Valid values: API_KEY, AWS_IAM, AMAZON_COGNITO_USER_POOLS, OPENID_CONNECT (required) | string | n/a | yes |
| aws\_region | The AWS region in which the user pool was created | string | `""` | no |
| client\_id | Client identifier of the Relying party at the OpenID identity provider. This identifier is typically obtained when the Relying party is registered with the OpenID identity provider. You can specify a regular expression so the AWS AppSync can validate against multiple client identifiers at a time. | string | `""` | no |
| cloudwatch\_logs\_role\_arn | Amazon Resource Name of the service role that AWS AppSync will assume to publish to Amazon CloudWatch logs in your account | string | `""` | no |
| default\_action | he action that you want your GraphQL API to take when a request that uses Amazon Cognito User Pool authentication doesn't match the Amazon Cognito User Pool configuration. Valid: ALLOW and DENY | string | `"ALLOW"` | no |
| field\_log\_level | Field logging level. Valid value: ALL, ERROR, NONE | string | `"none"` | no |
| iat\_ttl | Number of milliseconds a token is valid after being issued to a user | string | `""` | no |
| issuer | Issuer for the OpenID Connect configuration. The issuer returned by discovery MUST exactly match the value of iff in the ID Token | string | `""` | no |
| log\_config | Nested argument containing logging configuration. Defined below | string | `""` | no |
| name | A user-supplied name for the GraphqlApi | string | n/a | yes |
| openid\_connect\_config | Nested argument containing OpenID conect configuration | string | `""` | no |
| schema | The schema definition, in GraphQL schema language format | string | `""` | no |
| user\_pool\_config | The Amazon Cognito User Pool Configuration | string | `""` | no |
| user\_pool\_id | The user pool id (Required) | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id |  |

