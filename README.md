# docker-hugo

Docker image for hugo static page generator (https://gohugo.io)


## Environment Variables

* `HUGO_THEME`
* `HUGO_WATCH` (set to any value to enable watching)
* `HUGO_REFRESH_TIME` (in seconds, only applies if not watching, if not set, the container will build once and exit)


## Executing

    docker run --name "my-hugo" -P -v $(pwd):/src jojomi/hugo

Find your container:

    docker ps | grep "my-hugo"
    CONTAINER ID        IMAGE                           COMMAND                CREATED             STATUS              PORTS                   NAMES
    ba00b5c238fc        jojomi/hugo:latest   "/run.sh"              7 seconds ago       Up 6 seconds        1313/tcp      my-hugo


## Building The Image Yourself (optional)

    docker build -t jojomi/hugo:latest .

The image is conveniently small at **about 20 MB** thanks to [alpine](http://gliderlabs.viewdocs.io/docker-alpine):

    docker images | grep hugo
    jojomi/hugo   latest              b2e7a8364baa        1 second ago      20.7 MB


## Creating a new tag

```
export HUGO_RELEASE=0.14
# export HUGO_RELEASE=git
git checkout master
git checkout -b $HUGO_RELEASE
./update.sh $HUGO_RELEASE
git add .
git commit -m "version $HUGO_RELEASE"
git push -u origin $HUGO_RELEASE
```