FROM redhat/ubi8
RUN \
  groupadd -g 1001 paper && \
  useradd -mu 1001 -g paper paper && \
  chmod 777 /tmp && \
  dnf install -y java-17-openjdk
COPY --chown=1001:1001 docker-entrypoint.sh /
WORKDIR /app
COPY build/MultiPaper-paperclip*.jar multipaper.jar
COPY config/ ./
RUN \
  chown 1001:1001 -R ./
USER paper
EXPOSE 25565
ENV server_name=slave#null
ENV master_address=master
ENTRYPOINT ["/docker-entrypoint.sh"]