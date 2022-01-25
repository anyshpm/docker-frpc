FROM alpine:3.15

MAINTAINER Anyshpm Chen<anyshpm@anyshpm.com>

ARG FRP_VERSION

ENV FRP_VERSION=0.38.0

WORKDIR /

RUN set -x && \
    wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    tar zxvf frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    cp frp_${FRP_VERSION}_linux_${TARGETARCH}/frpc /usr/bin/ &&  \
    mkdir -p /etc/frp &&  \
    cp frp_${FRP_VERSION}_linux_${TARGETARCH}/frpc.ini /etc/frp &&  \
    rm frp_${FRP_VERSION}_linux_${TARGETARCH}.tar.gz &&  \
    rm -rf frp_${FRP_VERSION}_linux_${TARGETARCH}

CMD /usr/bin/frpc -c /etc/frp/frpc.ini
