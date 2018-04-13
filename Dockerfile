FROM node:9.11.1-alpine as builder

RUN npm install --global gitbook-cli && \
	gitbook fetch 3.2.3

ADD book.json /usr/local/src/updatehub-docs/
ADD docs /usr/local/src/updatehub-docs/docs

WORKDIR /usr/local/src/updatehub-docs

RUN gitbook install
RUN gitbook build

FROM alpine:3.7

COPY --from=builder /usr/local/src/updatehub-docs/_book/ /srv/http/

WORKDIR /srv/http

CMD httpd -f
