# Getting latest version from source repo
FROM  quay.io/ibmgaragecloud/cli-tools:v0.10.0-lite
ADD --chown=devops terraform run.sh /home/devops/src
WORKDIR /home/devops/src
USER root
RUN mkdir /scripts && mv run.sh /scripts
ENTRYPOINT ["/scripts/run.sh"]
