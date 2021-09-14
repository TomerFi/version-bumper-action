FROM docker.io/tomerfi/version-bumper:1.1.0

RUN find / -name ".git"

COPY .git /usr/share/repo/.git

COPY action.sh /usr/local/scripts/action.sh

RUN chmod a+x /usr/local/scripts/action.sh

ENTRYPOINT ["/usr/local/scripts/action.sh"]
