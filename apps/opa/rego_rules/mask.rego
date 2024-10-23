  package trino
  import future.keywords.in
  import future.keywords.if
  import future.keywords.contains

  column_resource := input.action.resource.column
  is_admin {
    input.context.identity.user == "admin"
  }

  columnMask := {"expression": "NULL"} if {
      not is_admin
      column_resource.catalogName == "tpch"
      column_resource.schemaName == "sf1"
      column_resource.tableName == "customer"
      column_resource.columnName == "phone"
  }