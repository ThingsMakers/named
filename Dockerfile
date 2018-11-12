FROM alpine:3.8

RUN apk add --no-cache bind

ADD entrypoint.sh /entrypoint.sh

RUN chmod 750 /entrypoint.sh

EXPOSE 53/udp

ENTRYPOINT ["./entrypoint.sh"]