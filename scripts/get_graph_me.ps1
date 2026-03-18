param([Parameter(Mandatory=$true)][string]$AccessToken)
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Method GET -Uri "https://graph.microsoft.com/v1.0/me" -Headers $Headers
