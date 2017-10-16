FROM alpine:3.6

RUN apk add --no-cache --update bash python3 py-pip git yarn && \
    pip install mkdocs pygments pymdown-extensions

RUN git clone -b updatehub https://github.com/updatehub/mkdocs-material.git /usr/local/src/mkdocs-material

WORKDIR /usr/local/src/mkdocs-material

RUN pip install -r requirements.txt && yarn install && yarn run build
RUN pip install -e .

ADD docs /usr/local/src/updatehub-docs/docs
ADD theme /usr/local/src/updatehub-docs/theme
ADD mkdocs.yml /usr/local/src/updatehub-docs

WORKDIR /usr/local/src/updatehub-docs

RUN mkdocs build -d /usr/local/share/docs/updatehub

WORKDIR /usr/local/share/docs/updatehub

CMD httpd -f
