FROM ubuntu:jammy

WORKDIR /app

RUN touch IAMNEW.txt



ENTRYPOINT ["tail", "-f", "/dev/null"]
