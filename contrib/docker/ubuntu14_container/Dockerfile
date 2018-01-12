FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y software-properties-common python-software-properties

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev libtool autotools-dev automake pkg-config libssl-dev libevent-dev \
    bsdmainutils git libboost-all-dev libminiupnpc-dev libqt5gui5 libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev qttools5-dev-tools \
    libprotobuf-dev protobuf-compiler libqrencode-dev

#nanite
RUN mkdir /root/Nanite
RUN git clone https://github.com/nanitecurrency/Nanite /root/Nanite
RUN cd /root/Nanite/ ; /root/Nanite/autogen.sh
RUN cd /root/Nanite/ ; /root/Nanite/configure
RUN cd /root/Nanite/ ; make

RUN chmod 0777 /root/Nanite/src/*

ADD ./conf/Nanite.conf /root/.Nanite/Nanite.conf

WORKDIR /root/Nanite

EXPOSE 21102 20102

#CMD printenv | grep -v "yyyyyxxxx" >> /etc/environment && tail -f /dev/null

CMD /root/Nanite/src/Nanited -printtoconsole
