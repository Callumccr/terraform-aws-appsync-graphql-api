output "id" {
  value = "${element(coalescelist(aws_appsync_graphql_api.example_1.*.id,aws_appsync_graphql_api.example_2.*.id,aws_appsync_graphql_api.example_3.*.id,aws_appsync_graphql_api.example_4.*.id),0)}"

}

