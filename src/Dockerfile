FROM debian:stable
ARG gauche_version
RUN apt-get update && \
    apt-get install -y build-essential \
        libtool pkg-config curl git unzip  \
        openssh-client zlib1g-dev
RUN mkdir /home/gauche
RUN cd /home/gauche && \
      curl https://raw.githubusercontent.com/shirok/get-gauche/master/get-gauche.sh > get-gauche.sh && \
      chmod +x get-gauche.sh && \
      ./get-gauche.sh --prefix /usr --version $gauche_version --auto
RUN cd /home/gauche && git clone https://github.com/shirok/Gauche-makiki.git
RUN cd /home/gauche/Gauche-makiki && ./configure && make && make install
CMD ["/usr/bin/gosh", "-i"]
