FROM docker.io/tomerfi/version-bumper:1.2.0

COPY action.sh /usr/local/scripts/action.sh

RUN chmod a+x /usr/local/scripts/action.sh

ENTRYPOINT ["/usr/local/scripts/action.sh"]
