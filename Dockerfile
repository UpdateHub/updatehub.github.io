FROM python:3.8.2-alpine3.11 as mkdocs

WORKDIR /docs

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY mkdocs.yml .
COPY docs docs

RUN mkdocs build

FROM nginx:1.17.9-alpine

COPY --from=mkdocs /docs/site /usr/share/nginx/html
