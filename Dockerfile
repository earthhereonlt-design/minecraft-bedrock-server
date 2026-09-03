FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /bedrock

RUN curl -L "https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.26.45.1.zip" \
    -o server.zip && \
    unzip server.zip && \
    rm server.zip

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 19132/udp

CMD ["/start.sh"]
