FROM alpine:3.16.0

# Use baseimage-docker's init system:
CMD ["/sbin/my_init"]

RUN apk add --no-cache git bash wget curl sudo make nodejs npm busybox build-essential aria2 ffmpeg unzip python python2 python3 ctorrent asciinema atomicparsley
# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home
COPY config.sh /home
COPY /stuff /home/stuff

# Run config.sh and clean up APT:
RUN sh /home/config.sh \
 && apk clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Install freyr:
RUN git clone https://github.com/miraclx/freyr-js.git \
 && cd freyr-js \
 && yarn install

RUN cd /home

# Install the bot:
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

RUN echo "Uploaded files:" && ls /home/stuff/

# Run bot script:
CMD bash /home/startbot.sh
