FROM ubuntu:jammy

WORKDIR /app

RUN touch latest-check

ENTRYPOINT ["tail", "-f", "/dev/null"]
