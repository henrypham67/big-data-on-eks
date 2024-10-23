package trino

import future.keywords.if

default allow = false

is_admin if {
	input.context.identity.user == "admin"
}

allow if {
	is_admin
}