FROM jekyll/jekyll:4.0

ENV BUNDLER_VERSION=2.2.7

ADD . /srv/jekyll

RUN gem install bundler:${BUNDLER_VERSION}

RUN jekyll build

EXPOSE 4000
