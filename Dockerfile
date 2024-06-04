FROM ubuntu:jammy

WORKDIR /app

RUN mkdir test

RUN touch test.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]