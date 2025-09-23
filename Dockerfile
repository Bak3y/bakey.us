FROM nginx

# Install required tools
RUN apt-get update && apt-get install -y \
  openssl \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Create directory for certificates
RUN mkdir -p /etc/letsencrypt/live/bakey.us

# Generate self-signed certificate for development
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/letsencrypt/live/bakey.us/privkey.pem \
  -out /etc/letsencrypt/live/bakey.us/fullchain.pem \
  -subj "/CN=localhost"

# Copy website files and nginx config
COPY html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
