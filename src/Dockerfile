FROM debian:stable
ARG gauche_version
RUN apt-get update && \
    apt-get install -y build-essential \
        autoconf automake libtool pkg-config \
        curl git unzip wget wkhtmltopdf xvfb \
        python-dev python-setuptools apt-transport-https \
        lsb-release openssh-client git
RUN mkdir /home/gauche
RUN cd /home/gauche && \
      wget http://practical-scheme.net/vault/Gauche-$gauche_version.tgz && \
      tar xzf Gauche-$gauche_version.tgz
RUN cd /home/gauche/Gauche-$gauche_version && \
      ./configure --prefix=/usr && make -j && make install
RUN cd /home/gauche && git clone https://github.com/shirok/Gauche-makiki.git
RUN cd /home/gauche/Gauche-makiki && ./configure && make && make install
CMD ["/usr/bin/gosh", "-i"]
