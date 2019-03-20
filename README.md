# docker-hugo

Docker image for the [Hugo static page generator](https://gohugo.io).

## Executing

Run the Docker container, using the sources in ```/tmp/hugo-site/src```, generating the static pages in ```/tmp/hugo-site/output```:

    docker run -it --rm \
           -v /tmp/hugo-site/src:/src \
           -v /tmp/hugo-site/dst:/dest \
           hugo

## Building The Image Yourself (optional)

    docker build -t hugo:latest .

The image is conveniently small at **about 20 MB** thanks to the used [alpine](http://gliderlabs.viewdocs.io/docker-alpine) Docker base image:

    docker images | grep hugo
    hugo   latest            b2e7a8364baa        1 second ago      21.9 MB
