FROM nginx:1.25.5-alpine

RUN apk add git

WORKDIR /usr/share/nginx/html
RUN rm -f ./*
RUN git clone https://github.com/uvapl/examide.git .