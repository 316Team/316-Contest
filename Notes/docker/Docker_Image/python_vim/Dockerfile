FROM ubuntu:14.04

ADD sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl \
	git \
    ipython \
	openssh-client \
	openssh-server \
	python \
	python-dev \
	python-pip \
	vim \
	tmux \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/run/sshd \
	&& mkdir -p /root/.ssh \
	&& sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd \
	&& useradd cimer \
	&& echo "cimer:cimer@123" | chpasswd \
	&& echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
	&& sed -ri 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config \
	&& echo "cimer    ALL=(ALL:ALL) ALL" >> /etc/sudoers \
	&& sed -ri 's/SHELL=\/bin\/sh/SHELL=\/bin\/bash/g' /etc/default/useradd

ADD authorized_keys /root/.ssh/authorized_keys

EXPOSE 22
