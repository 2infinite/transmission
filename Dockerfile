FROM alpine:latest
MAINTAINER 2infinite <2infinite@users.noreply.github.com>
RUN apk --no-cache add transmission-daemon
ENTRYPOINT ["nice", "ionice", "-c3", "/usr/bin/transmission-daemon", "-f", "--log-error", "--encryption-required" ]
