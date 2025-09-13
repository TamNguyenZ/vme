FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl coreutils

COPY start-sshx.sh /start-sshx.sh
RUN chmod +x /start-sshx.sh

CMD ["/start-sshx.sh"]
