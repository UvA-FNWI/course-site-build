FROM nginx:1.27.1-alpine

RUN apk add git

WORKDIR /usr/share/nginx/html
ADD "https://api.github.com/repos/uvapl/examide/commits/main" last-commit
RUN rm -f ./*
RUN git clone https://github.com/uvapl/examide.git .
