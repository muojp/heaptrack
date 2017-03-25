FROM ubuntu:16.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y libdwarf-dev libkf5coreaddons-dev libkf5i18n-dev libkf5itemmodels-dev \
                       libkf5configwidgets-dev libkf5kiocore5 libkf5kiowidgets5 kio-dev libsparsehash-dev libqt5svg5-dev \
                       libkf5threadweaver-dev extra-cmake-modules build-essential cmake git libunwind-dev libboost-all-dev \
                       gettext x11vnc xvfb net-tools \
 && rm -rf /var/lib/apt/lists/*

RUN git clone git://anongit.kde.org/kdiagram \
 && mkdir kdiagram/build \
 && cd kdiagram/build \
 && cmake .. \
 && make \
 && make install \
 && cd ../.. \
 && rm -rf kdiagram

RUN git clone git://anongit.kde.org/heaptrack \
 && mkdir heaptrack/build \
 && cd heaptrack/build \
 && cmake .. \
 && make \
 && make install \
 && cd ../.. \
 && rm -rf heaptrack

RUN mkdir -p /opt/noVNC/utils/websockify \
 && curl -SL https://github.com/novnc/noVNC/archive/7e19216.tar.gz | tar zx --strip-components=1 -C /opt/noVNC \
 && curl -SL https://github.com/kanaka/websockify/archive/5b7f722.tar.gz | tar zx --strip-components=1 -C /opt/noVNC/utils/websockify

COPY run.sh /root/run.sh
COPY index.html /opt/noVNC/

EXPOSE 6080

CMD /root/run.sh
