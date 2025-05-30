FROM alpine:3.22.0

# renovate: datasource=npm depName=@bitwarden/cli versioning=npm
ARG BW_CLI_VERSION=2023.9.0

RUN apk add --no-cache npm python3 make gcc g++ wget unzip curl jq \
  && npm i -g @bitwarden/cli@${BW_CLI_VERSION} \
  && install --mode=0700 --owner=65532 -d /.config/bw/

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]

ENV BITWARDENCLI_APPDATA_DIR=/.config/bw/

USER 65532:65532
