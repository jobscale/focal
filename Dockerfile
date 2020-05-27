FROM ubuntu:focal
SHELL ["bash", "-c"]
WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y vim git zip unzip curl jq \
 tmux net-tools dnsutils iputils-ping netcat procps \
 openssh-server sudo python3 python3-pip \
 && git clone https://github.com/jobscale/_.git \
 && useradd -g staff -G sudo -m -s /bin/bash focal \
 && mkdir /run/sshd \
 && echo "Set disable_coredump false" >> /etc/sudo.conf \
 && echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && sudo -u focal ssh-keygen -t ed25519 -C 'focal' -N '' -f /home/focal/.ssh/id_ed25519 \
 && cp -pa /home/focal/.ssh/id_ed25519.pub /home/focal/.ssh/authorized_keys \
 && cat /home/focal/.ssh/id_ed25519
RUN rm -fr /var/lib/apt/lists/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
