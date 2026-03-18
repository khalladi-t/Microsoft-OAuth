## Auth Overview

This document explains how `<your_app>` integrates with Microsoft Entra ID (Azure AD) using OAuth 2.0 / OpenID Connect.

## Goals
Support organizational sign-in.

Keep secrets and identifiers out of code by using runtime environment variables.

Use a flexible redirect URI that can be changed without recompiling.

## Flow - Authorization Code

1. User clicks “Sign in with Microsoft”
2. Browser is redirected to: https://login.microsoftonline.com/<tenant>/oauth2/v2.0/authorize</tenant>
