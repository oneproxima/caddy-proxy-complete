FROM caddy:2.8.1-builder AS builder

ADD VERSION .

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@v0.1.4

FROM caddy:2.8.1
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
