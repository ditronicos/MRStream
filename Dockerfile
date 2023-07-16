# Sistema Operativo
FROM ubuntu:20.04
LABEL maintainer "Ditronics"

# Variables
ENV TZ=Europe/Madrid
ENV ACESTREAM_VERSION="3.1.74_ubuntu_18.04_x86_64"

# config volume
VOLUME /opt

# Dependencias
RUN apt-get update -y && \
    apt-get install -y \
    python2.7 \
    libpython2.7 \
    python-apsw \
    python-lxml \
    python3 \
    python3-psutil \
    python3-gevent \
    python3-setuptools \
    python3-m2crypto \
    python3-apsw \
    unzip \
    wget && \
    wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python2 get-pip.py && \
    rm get-pip.py && \
    pip2 install requests isodate pycrypt pycryptodome && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ACEStream
RUN   wget --no-check-certificate "https://download.acestream.media/linux/acestream_${ACESTREAM_VERSION}.tar.gz" && \
      mkdir acestream && \
      tar zxf "acestream_${ACESTREAM_VERSION}.tar.gz" -C acestream && \
      mv acestream /opt/acestream && \
      rm -f acestream_${ACESTREAM_VERSION}.tar.gz

# HTTPACEProxy
RUN wget --no-check-certificate https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip && \
    unzip master.zip -d /opt/ && \
    rm -f master.zip

# Configuracion
ADD aceconfig.py /opt/HTTPAceProxy-master/aceconfig.py
ADD acestream.conf /opt/acestream/acestream.conf
ADD lordpedal.sh /bin

# Puertos
EXPOSE 6878 62062 8000

# Ejecucion
RUN chmod +x /opt/acestream/acestreamengine
RUN chmod +x /opt/acestream/start-engine
RUN chmod +x /bin/lordpedal.sh
CMD ["/bin/lordpedal.sh"]
