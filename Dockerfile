FROM progrium/busybox

MAINTAINER info.inspectit@novatec-gmbh.de

ENV INSPECTIT_VERSION 1.6.5.70

COPY dumb-init /dumb-init

RUN wget ftp://ftp.novatec-gmbh.de/inspectit/releases/RELEASE.${INSPECTIT_VERSION}/inspectit-cmr.linux.x64.tar.gz -qO - | gunzip | tar xvf - 
WORKDIR /CMR

VOLUME ["config", "db", "storage", "ci"]

EXPOSE 8182 9070

COPY run.sh run.sh
CMD ["/dumb-init", "/bin/sh", "run.sh"]
