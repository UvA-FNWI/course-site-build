FROM nginx:1.31.2-alpine

RUN apk add --no-cache git
RUN echo "types { text/javascript mjs; }" > /etc/nginx/conf.d/mjs.conf

WORKDIR /usr/share/nginx/html
ADD "https://api.github.com/repos/uvapl/examide/commits/main" last-commit
RUN rm -f ./*
RUN git clone https://github.com/uvapl/examide.git .
