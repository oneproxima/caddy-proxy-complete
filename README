Run `sudo docker build -t "caddy-dns:v#" .`, you should see it in the list when you run `sudo docker images`. Note even though the documentation kinda states that you don't need to open ports if using DNS challenge, but you do when reverse proxying. 

To use the caddy-dns/porkbun in the Caddyfile you'll need to define where it's used. Note I'm using environment variables, but see that I'm mapping from `subdomain.domain` to `domain:port`.

```bash
# globally
{ # Global Options
  email letsencrypt@randomproxima.com
  acme_dns porkbun {
    api_key {$PORKBUN_API_KEY}
    api_secret_key {$PORKBUN_API_SECRET_KEY}
  }
}

pairdrop.{$DOMAIN} {
  reverse_proxy {$DOMAIN}:3100
}
```

To reload Caddy after making changes to your Caddyfile:

```
sudo docker compose exec -w /etc/caddy caddy caddy reload
```

## References

- https://caddy.community/t/docker-build-with-modules/19255
