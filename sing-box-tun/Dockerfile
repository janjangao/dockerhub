FROM ghcr.io/sagernet/sing-box

COPY config /config

EXPOSE 9090 7890

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]