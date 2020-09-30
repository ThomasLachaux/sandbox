FROM archlinux

RUN pacman -Sy --noconfirm vim openssh iputils bind-tools
RUN useradd -mu 1000 docker
WORKDIR /home/docker

COPY scripts ./
RUN chmod -R g=u . /etc/passwd && chown -R docker:root .
USER docker

ENTRYPOINT ["./entrypoint.sh"]
CMD "./run.sh"