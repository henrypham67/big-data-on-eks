  package trino
  import future.keywords.in
  import future.keywords.if
  import future.keywords.contains

  table_resource := input.action.resource.table
  is_admin {
    input.context.identity.user == "admin"
  }

  rowFilters contains {"expression": "nationkey = 3"} if {
      not is_admin
      table_resource.catalogName == "tpch"
      table_resource.schemaName == "sf1"
      table_resource.tableName == "customer"
  }