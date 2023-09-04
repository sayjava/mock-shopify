FROM ghcr.io/sayjava/faker-server:0.1.0

COPY templates /templates

ENTRYPOINT ["server", "--templates", "/templates"]