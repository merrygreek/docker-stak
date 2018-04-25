FROM ubuntu:14.04

ENV SOURCE https://github.com/merrygreek/xmr-stak.git
ENV XMRSTAK_CMAKE_FLAGS -DXMR-STAK_COMPILE=generic -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF

# Innstall packages
RUN apt-get update && \
    set -x && \
    apt-get install -qq --no-install-recommends -y ca-certificates git cmake libhwloc-dev libmicrohttpd-dev libssl-dev

WORKDIR /tmp

RUN git clone $SOURCE . && \
    cmake ${XMRSTAK_CMAKE_FLAGS} . && \
    make

WORKDIR /usr/local/bin/

RUN mv /tmp/bin/* /usr/local/bin/ && \
    rm -rf /tmp/* && \
    apt-get purge -y -qq cmake wget git libhwloc-dev libmicrohttpd-dev libssl-dev && \
    apt-get clean -qq

COPY config.txt /usr/local/bin/
COPY cpu.txt /usr/local/bin/
COPY pools.txt /usr/local/bin/


ENTRYPOINT ["/usr/local/bin/xmr-stak"]
