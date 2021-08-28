FROM debian:buster-slim

ENV container docker

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo systemd python3 python3-pip \
        python-setuptools \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN pip install --upgrade pip

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
