FROM redhat/ubi8
RUN \
  groupadd -g 1001 velocity && \
  useradd -mu 1001 -g velocity velocity
RUN chmod 777 /tmp
RUN dnf install -y java-17-openjdk
COPY --chown=1001:1001 docker-entrypoint.sh /
WORKDIR  /app

COPY velocity*.jar velocity.jar
COPY velocity.toml .
COPY build/MultiPaper-Master*.jar ./plugins/MultiPaper-Master.jar
RUN  \
  chown 1001:1001 -R ./
USER velocity
EXPOSE 25565
EXPOSE 35353
ENTRYPOINT ["/docker-entrypoint.sh"]