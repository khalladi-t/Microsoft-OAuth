# Usage: mix run scripts/azure/token_exchange_httpc.exs "AUTH_CODE"
code = System.argv() |> List.first() || raise "Usage: mix run scripts/azure/token_exchange_httpc.exs <AUTH_CODE>"
resp = Utils.AzureAuth.get_token(code)
IO.inspect(resp, label: "token_exchange_resp")
