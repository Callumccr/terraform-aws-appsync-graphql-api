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
