FROM traefik AS traefik
FROM traefik/whoami AS whoami
FROM ghcr.io/sagernet/sing-box:v1.11.13

COPY --from=traefik /usr/local/bin/traefik /usr/local/bin/traefik
COPY --from=whoami /whoami /usr/local/bin/whoami

ENV PASS=live
ENV PORT=80

COPY etc/config /etc/config

EXPOSE 80 3128

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]