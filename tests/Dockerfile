FROM dockerfile/ruby
MAINTAINER Luan Santos <luan@luansantos.com>

ENV GOPATH /go

RUN \
  apt-get update && \
  apt-get install -y \
  git mercurial golang \
  xvfb && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  apt-get install -y \
  vim-gtk && \
  rm -rf /var/lib/apt/lists/*
