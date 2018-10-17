FROM practicalscheme/gauche:latest

RUN apt-get install -y autoconf automake

RUN cd /home/gauche && \
      git clone https://github.com/shirok/Gauche.git

CMD ["/bin/bash", "-c", "cd /home/gauche/Gauche; ./DIST self-host-test"]

      
      