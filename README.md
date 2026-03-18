## Fix Microsoft OAuth: remove hard‑coded values

Microsoft OAuth sign‑in can fail due to hard‑coded tenant and client_id settings in the OAuth URL builder. This repo details steps used to refactor the auth helper to use runtime environment variables, align the redirect URI with the App Registration, ensure the Phoenix endpoint serves HTTPS, and simplify the callback controller to avoid 500s while token exchange is wired. You'll now point the router to the exact redirect path used in Azure.



## Getting Started

![Microsoft OAuth](https://img.shields.io/badge/Microsoft%20OAuth2-Enabled-0078D4?logo=microsoft) ![OIDC](https://img.shields.io/badge/OIDC-OpenID%20Connect-FF6F00?logo=openid) ![Entra ID](https://img.shields.io/badge/Entra%20ID-Integrated-5E5E5E?logo=microsoft-entra) ![Azure](https://img.shields.io/badge/Azure-Integrated-0078D7?logo=microsoft-azure) ![Azure App Registration](https://img.shields.io/badge/Azure%20App%20Registration-Configured-0078D4?logo=azure-devops) ![Azure OAuth v2](https://img.shields.io/badge/OAuth%20Endpoint-v2.0-0089D6?logo=microsoft) ![OAuth2](https://img.shields.io/badge/OAuth2-Enabled-blue) ![Erlang OTP](https://img.shields.io/badge/Erlang%2FOTP-25+-A90533?logo=erlang)



## Symptoms 

AADSTS90023: “Specified tenant identifier ‘test’ is neither a valid DNS name, nor a valid external domain.”

AADSTS50011: Redirect URI mismatch after initial hard‑code fix.

ERR_CONNECTION_REFUSED: Browser could not reach port 4001.

HTTP 500 on callback due to controller expecting HTTPoison.Response and calling unimplemented user‑info paths.


## Scenario

OAuth URLs were built from hard‑coded module attributes in azure_auth.ex. Redirect URI in the application did not match the Azure App Registration redirect list. Controller callback expected HTTPoison response types and a user‑info call we had not implemented (stub), causing 500s.


## Steps 1
    Check OAuth Helper — lib/<your_app_name>/utils/azure_auth.ex
     
## Step 2 
    Check  Runtime Config — config/runtime.exs
      
## Step 3 
    Check Router — lib/<your_app_name>/router.ex
      
## Step 4
    (Optional) Check Controller — lib/<your_app_name>/controllers/azure_auth_controller.ex


## Links
https://opensource.microsoft.com/codeofconduct/

https://portal.azure.com/

https://github.com/khalladi-t/microsoft-oauth/actions/workflows/elixir.yml/badge.svg
