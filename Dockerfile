FROM alpine:3.22 AS certs
RUN apk add --no-cache openssl \
 && mkdir -p /etc/letsencrypt/live/bakey.us \
 && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
      -keyout /etc/letsencrypt/live/bakey.us/privkey.pem \
      -out /etc/letsencrypt/live/bakey.us/fullchain.pem \
      -subj "/CN=localhost" \
 && chmod 644 /etc/letsencrypt/live/bakey.us/fullchain.pem \
 && chmod 600 /etc/letsencrypt/live/bakey.us/privkey.pem

# Multi-arch index for cgr.dev/chainguard/nginx:latest as of 2026-10-23.
FROM cgr.dev/chainguard/nginx@sha256:9aa6c46648f17b2835d009fd4338b38591b2396670a07270ee19b532f83dbbb5
COPY --from=certs --chown=nginx:nginx /etc/letsencrypt /etc/letsencrypt
COPY html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx-security-headers.conf /etc/nginx/security-headers.conf
