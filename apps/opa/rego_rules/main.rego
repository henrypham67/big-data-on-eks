package trino

import future.keywords.if

default allow = true

is_admin if {
	input.context.identity.user == "admin"
}

allow if {
	is_admin
}