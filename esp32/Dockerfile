FROM nfqlt/debian-stretch

ADD build /build
RUN bash /build/setup_docker.sh && rm -Rf /build

USER project
WORKDIR /home/project
ENV TERM xterm
CMD bash -l

