local typedefs = require("kong.db.schema.typedefs")

return {
	name = "oidc",
	fields = {
		{ consumer = typedefs.no_consumer },
		{ protocols = typedefs.protocols_http },
		{
			config = {
				type = "record",
				fields = {
					{ client_id = { type = "string", required = true } },
					{ client_secret = { type = "string", required = true } },
					{
						discovery = {
							type = "string",
							required = true,
							default = "https://.well-known/openid-configuration",
						},
					},
					{ introspection_endpoint = { type = "string" } },
					{ timeout = { type = "number" } },
					{ introspection_endpoint_auth_method = { type = "string" } },
					{ bearer_only = { type = "string", required = true, default = "no" } },
					{ realm = { type = "string", required = true, default = "kong" } },
					{ redirect_uri = { type = "string" } },
					{ scope = { type = "string", required = true, default = "openid" } },
					{ response_type = { type = "string", required = true, default = "code" } },
					{ ssl_verify = { type = "string", required = true, default = "no" } },
					{ use_jwks = { type = "string", required = true, default = "no" } },
					{
						token_endpoint_auth_method = {
							type = "string",
							required = true,
							default = "client_secret_post",
						},
					},
					{ session_secret = { type = "string" } },
					{ recovery_page_path = { type = "string" } },
					{ logout_path = { type = "string", default = "/logout" } },
					{ redirect_after_logout_uri = { type = "string", default = "/" } },
					{ unauth_action = { type = "string", default = "auth" } },
					{ filters = { type = "string" } },
					{ ignore_auth_filters = { type = "string", default = "none" } },
					{ userinfo_header_name = { type = "string", default = "X-USERINFO" } },
					{ id_token_header_name = { type = "string", default = "X-ID-Token" } },
					{ access_token_header_name = { type = "string", default = "X-Access-Token" } },
					{ access_token_as_bearer = { type = "string", default = "no" } },
					{ disable_userinfo_header = { type = "string", default = "no" } },
					{ disable_id_token_header = { type = "string", default = "no" } },
					{ disable_access_token_header = { type = "string", default = "no" } },
					{ revoke_tokens_on_logout = { type = "string", default = "no" } },
					{ groups_claim = { type = "string", default = "groups" } },
					{ skip_already_auth_requests = { type = "string", default = "no" } },
					{ bearer_jwt_auth_enable = { type = "string", default = "no" } },
					{ bearer_jwt_auth_allowed_auds = { type = "array", elements = { type = "string" } } },
					{
						bearer_jwt_auth_signing_algs = {
							type = "array",
							elements = { type = "string" },
							default = { "RS256" },
						},
					},
					{ header_names = { type = "array", elements = { type = "string" }, default = {} } },
					{ header_claims = { type = "array", elements = { type = "string" }, default = {} } },
				},
			},
		},
	},
}
