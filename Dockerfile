FROM alpine:latest

ARG TF_VERSION=0.13.1
ARG TF_VERSION_SHA256SUM=f7b842d1c06045b496fd00db83520e83a974a294b070dbaf88cb1013c5f02caf

COPY terraform_${TF_VERSION}_linux_amd64.zip .
RUN echo "${TF_VERSION_SHA256SUM}  terraform_${TF_VERSION}_linux_amd64.zip" > checksum && sha256sum -c checksum

RUN /usr/bin/unzip terraform_${TF_VERSION}_linux_amd64.zip

FROM ubuntu
RUN apt-get -y update && apt-get -y install ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=0 terraform /usr/bin/terraform
ENTRYPOINT ["/usr/bin/terraform"]
