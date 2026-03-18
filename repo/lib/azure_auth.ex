defmodule Utils.AzureAuth do
  @moduledoc "Microsoft Entra ID (Azure AD) OAuth2 helpers."

  defp cfg do
    %{
      tenant_id: Application.get_env(:<your_app_name>, :ms_tenant, "organizations"),
      client_id: Application.get_env(:<your_app_name>, :ms_client_id) || raise("MS_CLIENT_ID missing"),
      client_secret: Application.get_env(:<your_app_name>, :ms_client_secret) || raise("MS_CLIENT_SECRET missing"),
      redirect_url: Application.get_env(:<your_app_name>, :ms_redirect_uri) || raise("MS_REDIRECT_URI missing"),
      scope: Application.get_env(:<your_app_name>, :ms_scope, "openid profile email offline_access")
    }
  end

  def authorize_url do
    c = cfg()

    URI.to_string(%URI{
      scheme: "https",
      host: "login.microsoftonline.com",
      path: "/#{c.tenant_id}/oauth2/v2.0/authorize",
      query:
        URI.encode_query(%{
          "client_id" => c.client_id,
          "response_type" => "code",
          "response_mode" => "query",
          "scope" => c.scope,
          "redirect_uri" => c.redirect_url,
          "state" => "12345"
        })
    })
  end

  def auth_url(_opts \\ nil), do: authorize_url()

  def token_url, do: "https://login.microsoftonline.com/#{cfg().tenant_id}/oauth2/v2.0/token"

  def get_token(code) do
    c = cfg()

    body =
      URI.encode_query(%{
        "client_id" => c.client_id,
        "client_secret" => c.client_secret,
        "grant_type" => "authorization_code",
        "code" => code,
        "redirect_uri" => c.redirect_url
      })

    :httpc.request(
      :post,
      {String.to_charlist(token_url()), [], 'application/x-www-form-urlencoded', String.to_charlist(body)},
      [],
      []
    )
  end

  def get_user_info_by_token(_token), do: {:error, :not_implemented}
  def set_token_record_for_person(_person, _tokens), do: :ok
end
