# Keker&Loler

This setup includes a placeholder page, featuring the legendary story of **Keker & Loler**. 

# V2Fly Trojan with Nginx and Docker

This simple setup provides a secure V2Fly Trojan server with Nginx as a reverse proxy. It supports TLS encryption using Let's Encrypt certificates.([configuration guide](https://www.v2fly.org/en_US/v5/config/proxy/trojan.html))

## Prerequisites

- A server with a public IP address.
- A registered domain name.
- Docker and Docker Compose installed ([installation guide](https://docs.docker.com/engine/install/)).
- Certbot for obtaining SSL certificates ([installation guide](https://certbot.eff.org/)).

## Setup Instructions


### 1. Obtain SSL Certificates

Before running the script, make sure you have obtained SSL certificates using Certbot:

```bash
sudo certbot certonly --standalone -d example.com
```

This will generate certificates under `/etc/letsencrypt/live/example.com/`.

### 2. Run the Setup Script

Use the `fast_run.sh` script to automate the setup. Provide your domain name and password as environment variables:

```bash
DOMAIN_NAME=example.com PASSWORD=yourpassword bash fast_run.sh
```

### 3. What the Script Does

The script performs the following actions:

1. Validates that `DOMAIN_NAME` and `PASSWORD` are set.
2. Copies and modifies the Nginx configuration.
3. Copies and modifies the V2Fly configuration (`config.json`).
4. Builds and starts the Docker containers.
5. Prints the Trojan connection URL.

### 4. Connect to the Server

After running the script, you will see a connection URL like this:

```bash
trojan://yourpassword@example.com:443?security=tls&sni=example.com&type=tcp#Me
```

Use this URL in a V2Ray client to connect securely.

### 6. Logs and Debugging

Check logs if something goes wrong:

```bash
docker logs nginx
docker logs v2ray
```

Ensure ports 80 and 443 are open in your firewall for proper operation.


