FROM redhat/ubi8 as builder

RUN dnf install -y java-17-openjdk-devel git
RUN \
  git config --global user.email "indocker@container.com" && \
  git config --global user.name "docker build"
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN git clone https://github.com/MetaCringer/MultiPaper.git && mv MultiPaper build
WORKDIR /build
RUN ./gradlew applyPatches && ./gradlew shadowjar createReobfPaperclipJar
RUN \
    mkdir slave master
ENTRYPOINT ["/docker-entrypoint.sh"]
