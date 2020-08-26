## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| authentication\_type | The authentication type. Valid values: API\_KEY, AWS\_IAM, AMAZON\_COGNITO\_USER\_POOLS, OPENID\_CONNECT (required) | `string` | n/a | yes |
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| graphqlapi\_name | A user-supplied name for the GraphqlApi | `string` | n/a | yes |
| user\_pool\_id | The user pool id (Required) | `string` | n/a | yes |
| app\_id\_client\_regex | A regular exprecion for validating the incoming Amazon Cognito User Pool app client ID | `string` | `""` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| auth\_ttl | Number of millseconds a token is valid after being authenticated | `string` | `""` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| client\_id | Client identifier of the Relying party at the OpenID identity provider. This identifier is typically obtained when the Relying party is registered with the OpenID identity provider. You can specify a regular expression so the AWS AppSync can validate against multiple client identifiers at a time. | `string` | `""` | no |
| cloudwatch\_logs\_role\_arn | Amazon Resource Name of the service role that AWS AppSync will assume to publish to Amazon CloudWatch logs in your account | `string` | `""` | no |
| default\_action | he action that you want your GraphQL API to take when a request that uses Amazon Cognito User Pool authentication doesn't match the Amazon Cognito User Pool configuration. Valid: ALLOW and DENY | `string` | `"ALLOW"` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| field\_log\_level | Field logging level. Valid value: ALL, ERROR, NONE | `string` | `"none"` | no |
| iat\_ttl | Number of milliseconds a token is valid after being issued to a user | `string` | `""` | no |
| issuer | Issuer for the OpenID Connect configuration. The issuer returned by discovery MUST exactly match the value of iff in the ID Token | `string` | `""` | no |
| log\_config | Nested argument containing logging configuration. Defined below | `string` | `""` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| openid\_connect\_config | Nested argument containing OpenID conect configuration | `string` | `""` | no |
| schema\_dir | The schema definition, in GraphQL schema language format | `string` | `""` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| user\_pool\_config | The Amazon Cognito User Pool Configuration | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The API AWS ARN |
| id | The API AWS ID |
| uris | Map of URIs associated with the API. |

