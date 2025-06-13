FROM traefik AS traefik
FROM traefik/whoami AS whoami
FROM ghcr.io/sagernet/sing-box

COPY --from=traefik /usr/local/bin/traefik /usr/local/bin/traefik
COPY --from=whoami /whoami /usr/local/bin/whoami

ENV UUID=c8f8d2b3-3f86-4f24-8b3f-0d7df3b6c4a1
ENV PORT=80

COPY config /config

EXPOSE 80 443 8443

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]