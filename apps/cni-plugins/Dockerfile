FROM public.ecr.aws/docker/library/alpine:3.19.1

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG VERSION
ARG CHANNEL
ARG TARGETARCH

USER root
ADD https://github.com/containernetworking/plugins/releases/download/v${VERSION}/cni-plugins-linux-${TARGETARCH}-v${VERSION}.tgz /
RUN mkdir /plugins && \
  tar -zxvf /*.tgz -C /plugins && \
  rm /*.tgz
CMD cp /plugins/* /host/opt/cni/bin
