# bakey.us

Repo for storing the HTML and docker container for my website.

![ci-cd](https://github.com/Bak3y/bakey.us/workflows/ci-cd/badge.svg)

# Local Development

To preview the website locally:

1. Make sure Docker is installed
2. Run: `docker-compose up --build`
3. Open http://localhost:8000/scavenger.html in your browser

Changes to HTML and CSS files will be reflected immediately. Changes to nginx.conf require rebuilding the container. Press Ctrl+C to stop the server.
