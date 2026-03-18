## Deploy on AWS EC2 (HTTPS on 4001 or 443)

This document outlines a simple EC2 deployment for `<your_app>` with TLS terminated in Phoenix.

## 1) Instance & Network
- Launch an EC2 instance (Ubuntu recommended).
- Security Group inbound rules:
  - TCP 4001 (or **443** if you prefer standard HTTPS)
  - TCP 22 (SSH) from your admin IP
- (Optional) Allocate Elastic IP or use a domain + DNS A record.

## 2) TLS Certificates
Place TLS files on the instance: 

    /etc/ssl/<your_app_name>/fullchain.pem
    /etc/ssl/<your_app_name>/privkey.pem

## 3) System Environment
Copy `.env.sample` → `.env`, fill values, then:
```bash
set -a; source .env; set +a

# config/runtime.exs has:

```bash
config :<your_app>, <your_app>Web.Endpoint,
  https: [
    ip: {0, 0, 0, 0},
    port: 4001, # or 443
    cipher_suite: :strong,
    certfile: "/etc/ssl/<your_app>/fullchain.pem",
    keyfile: "/etc/ssl/<your_app>/privkey.pem"
  ],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  server: true
