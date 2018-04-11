# docker-hugo

Docker image for Hugo static page generator (https://gohugo.io)


## Environment Variables

* `HUGO_THEME`
* `HUGO_DESTINATION` (Path where hugo will render the site. By default `/output`)
* `HUGO_BASEURL`


## Executing

    docker run --name "my-hugo" -P -v $(pwd):/src piccobit/hugo

Or, more verbosely, and with a specified output mapping:

    docker run --name "my-hugo" --publish-all \
           --volume $(pwd):/src \
           --volume /tmp/hugo-build-output:/output \
           piccobit/hugo

Find your container:

    docker ps | grep "my-hugo"
    CONTAINER ID        IMAGE                           COMMAND                CREATED             STATUS              PORTS                   NAMES
    ba00b5c238fc        piccobit/hugo:latest            "/run.sh"              7 seconds ago       Up 6 seconds        1313/tcp      my-hugo


## Building The Image Yourself (optional)

    docker build -t piccobit/hugo:latest .

The image is conveniently small at **about 20 MB** thanks to [alpine](http://gliderlabs.viewdocs.io/docker-alpine):

    docker images | grep hugo
    piccobit/hugo:0.18   latest            b2e7a8364baa        1 second ago      21.9 MB


## Creating a new tag

Create a new git branch, change the line `ENV HUGO_VERSION=0.38` in `Dockerfile` and wire it in the Docker Hub accordingly.
