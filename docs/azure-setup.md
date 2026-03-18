## Azure Setup

This guide sets up a Microsoft App Registration for `<your_app>`.

## 1) Create App Registration
- Azure Portal → Microsoft Entra ID → App registrations → New registration
- Name: `<your_app>`
- Supported account types:
  - Accounts in any organizational directory (Multitenant) (recommended), or
  - Single tenant (use your tenant GUID/domain in `MS_TENANT`).
- Redirect URI (Platform: Web):  
  `https://<public-host-or-ip>:4001/azure_auth/code_response`  
  (Add dev too: `http://localhost:4000/azure_auth/code_response`)

Save the app. Copy:
- Application (client) ID → `MS_CLIENT_ID`
- Directory (tenant) ID (if using single tenant) → `MS_TENANT`

## 2) Client Secret
- App → Certificates & secrets → New client secret
- Copy the **secret value** once (not the ID) → `MS_CLIENT_SECRET`.

## 3) API Permissions (optional for Graph)
- App → API permissions → Add a permission → Microsoft Graph
  - Delegated: `User.Read` (for `/v1.0/me`)
- Grant admin consent** if required.

## 4) Confirm Redirect URIs
App → Authentication:
- Ensure Web redirect URIs include:
  - `https://<public-host-or-ip>:4001/azure_auth/code_response`
  - `http://localhost:4000/azure_auth/code_response` (dev)
- Leave SPA blank unless you have a browser-only client.

## 5) Match Runtime Env
On your server or in `.env`:


    MS_TENANT=organizations       
    MS_CLIENT_ID=<GUID>
    MS_CLIENT_SECRET=<SECRET_VALUE>
    MS_REDIRECT_URI=https://<public-host-or-ip>:4001/azure_auth/code_response
    MS_SCOPE="openid profile email offline_access"
