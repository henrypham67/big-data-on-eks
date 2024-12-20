package trino

import future.keywords.if

default allow = false

is_admin if {
	input.context.identity.user == "joao_loureiro@outlook.com"
	or input.context.identity.user == "dbt_user"
}

allow if {
	is_admin
}