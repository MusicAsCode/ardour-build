
FROM ubuntu:19.10
LABEL Name=ardour-build Version=0.0.1

ENV XARCH=x86_64
ENV ROOT=/ardour
ENV MAKEFLAGS=-j4

RUN echo "jackd2 jackd/tweak_rt_limits boolean true" | debconf-set-selections && \
  apt-get -y update && \
  apt-get install -y \
  wget \
  git \
  apt-utils \
  glibmm-2.4-dev \
  jack \
  jackd \
  libarchive-dev \
  libasound2-dev \
  libaubio-dev \
  libboost-all-dev \
  libcurl4-gnutls-dev \
  libcwiid-dev \
  libfftw3-dev \
  libglib2.0-dev \
  libgtkmm-2.4-dev \
  libjack-jackd2-dev \
  liblilv-dev \
  liblo-dev \
  liblrdf0-dev \
  librubberband-dev \
  libsamplerate-dev \
  libserd-dev \
  libsndfile1-dev \
  libsord-dev \
  libsratom-dev \
  libtag1-dev \
  libxml2-dev \
  lv2-dev \
  vamp-plugin-sdk

RUN wget http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz && \
    tar -xzvf libsndfile-1.0.28.tar.gz libsndfile-1.0.28 && \
    cd libsndfile-1.0.28 && sh configure && make && make install && \
    cd .. && rm -rf libsndfile*

RUN groupadd -g 1000 ardour && \
    useradd --create-home -u 1000 -g 1000 -s /bin/bash ardour
USER ardour
WORKDIR /home/ardour

RUN mkdir source && \
    cd source && \
    git clone git://github.com/Ardour/ardour.git 5.12 && \
    cd 5.12 && \
    git checkout 5.12 && \
    ./waf configure --prefix /home/ardour/5.12 && \
    ./waf build install && \
    cd ../../ && \
    rm -rf source

CMD [ "/home/ardour/5.12/bin/ardour5" ]
