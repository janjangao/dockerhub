FROM ghcr.io/sagernet/sing-box

ENV UUID=c8f8d2b3-3f86-4f24-8b3f-0d7df3b6c4a1

COPY config /config

EXPOSE 9090 7890

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]