FROM alpine:latest

RUN apk add --no-cache caddy which curl

EXPOSE 8080 8443
WORKDIR /srv

ADD Caddyfile /etc/caddy/Caddyfile
ADD public/ /srv/public/
ADD publics/ /srv/publics/
ADD certs/ /srv/certs

ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/caddy/Caddyfile"]
