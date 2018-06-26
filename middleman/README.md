# wakate/middleman

# How to

## Setup
```sh
$ git clone https://github.com/wakate/Dockerfile.git
$ cd Dockerfile/middleman/
$ docker build -t wakate/middleman .
```
## On Git repository
```sh
$ docker run -it -p 80:3000 -e "REPO=https://github.com/$(YOUR_REPO).git" -e "BRANCH=master" wakate/middleman
```

## On local
```sh
$ docker run -it -p 80:3000 -v $PWD:/opt wakate/middleman
```

