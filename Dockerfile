FROM alpine:latest

RUN apk add --no-cache caddy which curl

EXPOSE 8080 8443
WORKDIR /srv

COPY Caddyfile /etc/caddy/Caddyfile
COPY public/ /srv/public/
COPY publics/ /srv/publics/
COPY certs/ /srv/certs/
COPY tmp/ca.pem /tmp/ca.pem

ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/caddy/Caddyfile"]
