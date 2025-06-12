FROM ghcr.io/sagernet/sing-box:v1.11.13

ENV PORT 3001
ENV PASSWORD live

COPY etc/config/sing-box/config.json /etc/config/sing-box/config.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["run", "-c", "/etc/config/sing-box/config.json"]