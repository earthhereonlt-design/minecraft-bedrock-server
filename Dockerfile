FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /bedrock

COPY server/ /bedrock/

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 19132/udp

CMD ["/start.sh"]
