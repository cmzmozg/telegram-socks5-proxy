FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y dante-server dnsutils && \
    rm -rf /var/lib/apt/lists/*

COPY danted.conf /etc/danted.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["danted"]