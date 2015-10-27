FROM ubuntu:14.04

MAINTAINER Tariq Kamal <github.t-boy@xoxy.net>

LABEL vendor="Tariq Kamal" \
      net.bebudak.version="0.0.1-alpha" \
      net.bebudak.release_date="2015-10-27" \
      net.bebudak.project_name="df/lnp/docker"

RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y default-jre libsdl1.2debian:i386 libsdl-image1.2:i386 libsdl-ttf2.0-0:i386 libglu1-mesa:i386 libgtk2.0-0:i386  libopenal1:i386 libjpeg62:i386 coreutils g++ gcc patch xterm sed  python bzip2 qtchooser qtbase5-dev qtbase5-dev-tools qtscript5-dev qt5-qmake libqt5script5 libqt5scripttools5 libqxt-core0 libqxt-gui0 wget unzip locales

ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN mkdir -p /home/Urist/bin/df
WORKDIR /home/Urist/bin/df

ENV uid=1000 gid=1000

RUN echo "Urist:x:${uid}:${gid}:Urist,,,:/home/Urist:/bin/bash" >> /etc/passwd && \
    echo "Urist:x:${uid}:" >> /etc/group && \
    echo "Urist ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/Urist && \
    chmod 0440 /etc/sudoers.d/Urist && \
    chown ${uid}:${gid} -R /home/Urist

USER Urist
ENV HOME /home/Urist

CMD /home/Urist/bin/df/startlnp
