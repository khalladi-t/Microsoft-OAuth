config :<your_app_name>,
  ms_tenant: System.get_env("MS_TENANT") || "organizations",
  ms_client_id: System.fetch_env!("MS_CLIENT_ID"),
  ms_client_secret: System.fetch_env!("MS_CLIENT_SECRET"),
  ms_redirect_uri: System.fetch_env!("MS_REDIRECT_URI"),
  ms_scope: System.get_env("MS_SCOPE") || "openid profile email offline_access"
