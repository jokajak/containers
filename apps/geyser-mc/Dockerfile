FROM debian:latest

ARG DEBIAN_FRONTEND=noninteractive
ARG GEYSER_PORT=19132/udp
ARG GEYSER_URL_BASE=https://download.geysermc.org/v2/projects
ARG GEYSER_URL=geyser/versions/latest/builds/latest/downloads/standalone
ARG GEYSER_CONNECT_URL=geyserconnect/versions/latest/builds/latest/downloads/geyserconnect

WORKDIR /var/lib/geyser

RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  openjdk-17-jre-headless \
  curl \
  ncat \
  unzip \
  vim \
  && apt-get autoremove --yes --purge \
  && apt-get clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /opt/geyser/extensions/ /var/lib/geyser/extensions/ \
  && curl --location --output-dir /opt/geyser --output Geyser-Standalone.jar ${GEYSER_URL_BASE}/${GEYSER_URL} \
  && curl --location --output-dir /opt/geyser/extensions --output GeyserConnect.jar ${GEYSER_URL_BASE}/${GEYSER_CONNECT_URL}

COPY entrypoint.sh /opt/geyser/entrypoint.sh
# COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /var/lib/geyser

# Create a new user guacamole
ARG UID=1001
ARG GID=1001
RUN groupadd --gid $GID geyser \
  && useradd --system --create-home --shell /usr/sbin/nologin --uid $UID --gid $GID geyser

# Run with user geyser
USER geyser

EXPOSE ${GEYSER_PORT}

# Environment variable defaults
ENV GEYSER_HOME=/var/lib/geyser

CMD ["/opt/geyser/entrypoint.sh"]
