FROM ubuntu:jammy

WORKDIR /app

RUN mkdir test

RUN touch test.txt
RUN touch me.txt


ENTRYPOINT ["tail", "-f", "/dev/null"]
