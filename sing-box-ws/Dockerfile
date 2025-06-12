FROM traefik AS traefik
FROM traefik/whoami AS whoami
FROM ghcr.io/sagernet/sing-box:v1.11.13

COPY --from=traefik /traefik /usr/local/bin/traefik
COPY --from=whoami /whoami /usr/local/bin/whoami

ENV PASSWORD live
ENV PORT 80

COPY etc/config/sing-box/config.json /etc/config/sing-box/config.json
COPY etc/config/traefik/traefik.yml /etc/config/traefik/traefik.yml

WORKDIR /app
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]