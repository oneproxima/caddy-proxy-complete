FROM caddy:2.7.4-builder AS builder
# FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@v0.1.4
    # --with github.com/caddy-dns/porkbun@v0.1.4
    # --with <additional-plugins>

FROM caddy:2.7.4
# TODO change version to env vars CADDY_VERSION & PORKBUN-DNS_VERSION
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
