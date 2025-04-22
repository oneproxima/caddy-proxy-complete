FROM caddy:2.10.0-builder AS builder

ADD VERSION .

RUN xcaddy build \
    --with github.com/caddy-dns/porkbun@v0.2.1 \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:2.10.0
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
