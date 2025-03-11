FROM v2fly/v2fly-core:latest

COPY ./config.json /etc/v2ray/config.json

CMD ["run", "--config=/etc/v2ray/config.json"]