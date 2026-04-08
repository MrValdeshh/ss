FROM alpine:latest

LABEL maintainer="MrValdez"

WORKDIR /app

RUN apk add --no-cache wget unzip

RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip \
    && rm v2ray-linux-64.zip

COPY config.json /app/config.json

EXPOSE 8080

ENTRYPOINT ["./v2ray"]
CMD ["run", "-config", "/app/config.json"]
