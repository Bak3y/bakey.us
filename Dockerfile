FROM alpine:latest AS certs
RUN apk add --no-cache openssl
RUN mkdir -p /etc/letsencrypt/live/bakey.us
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/letsencrypt/live/bakey.us/privkey.pem \
  -out /etc/letsencrypt/live/bakey.us/fullchain.pem \
  -subj "/CN=localhost"
# Fix permissions for nginx user
RUN chmod 644 /etc/letsencrypt/live/bakey.us/*.pem \
  && chown -R 101:101 /etc/letsencrypt

FROM cgr.dev/chainguard/nginx:latest
COPY --from=certs --chown=nginx:nginx /etc/letsencrypt /etc/letsencrypt
COPY html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
