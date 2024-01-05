FROM caddy:2.7.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun

FROM caddy:2.7.4
# TODO change version to env vars CADDY_VERSION & PORKBUN-DNS_VERSION
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
