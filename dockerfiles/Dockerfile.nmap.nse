# https://hub.docker.com/_/alpine
FROM alpine:latest
LABEL org.opencontainers.image.authors="githubfoam"


RUN apk --update add nmap \
                     nmap-scripts \
                     git \
                     bash & \ 
        rm -rf /var/lib/apt/lists/* && \
        rm /var/cache/apk/*  && \
        git clone https://github.com/scipag/vulscan.git /usr/share/nmap/scripts/vulscan

WORKDIR /usr/share/nmap/scripts/vulscan

#Update CVE databases
CMD ["/bin/bash","updateFiles.sh"]

ENTRYPOINT ["nmap"]
CMD ["-h"]