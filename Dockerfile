FROM phusion/baseimage:focal-1.2.0

# Use baseimage-docker's init system:
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    sudo \
    wget \
    git \
    make \
    nodejs \
    npm \
    busybox \
    build-essential \
    aria2 \
    ffmpeg \
    unzip \
    python \
    python2 \
    python3 \
    ctorrent \
    asciinema \
    atomicparsley \
 && apt-get upgrade -y \
 && mkdir -p /home/stuff
# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home
COPY config.sh /home
COPY /stuff /home/stuff

# Run config.sh and clean up APT:
RUN sh /home/config.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Install freyr:
RUN git clone https://github.com/miraclx/freyr-js.git \
 && cd freyr-js \
 && npm install 

RUN cd /home

# Install the bot:
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

RUN echo "Uploaded files:" && ls /home/stuff/

# Run bot script:
CMD bash /home/startbot.sh
