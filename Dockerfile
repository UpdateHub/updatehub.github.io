FROM alpine:3.6

RUN apk add --no-cache --update bash python3 py-pip && \
    pip install mkdocs mkdocs-material pygments pymdown-extensions

ADD docs /usr/local/src/updatehub-docs/docs
ADD theme /usr/local/src/updatehub-docs/theme
ADD mkdocs.yml /usr/local/src/updatehub-docs

WORKDIR /usr/local/src/updatehub-docs

RUN mkdocs build -d /usr/local/share/docs/updatehub

WORKDIR /usr/local/share/docs/updatehub

CMD httpd -f
