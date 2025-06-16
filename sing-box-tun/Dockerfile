FROM ghcr.io/sagernet/sing-box

RUN mkdir -p /var/lib/sing-box

COPY config /config

EXPOSE 7890

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]