FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates jq && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /bedrock

RUN curl -fsSL https://www.minecraft.net/en-us/download/server/bedrock \
    -o /tmp/page.html

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 19132/udp

CMD ["/start.sh"]
