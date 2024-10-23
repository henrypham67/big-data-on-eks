package trino

import future.keywords.if

default allow = false

is_admin if {
	input.context.identity.user == "joao_loureiro@outlook.com"
}

allow if {
	is_admin
}