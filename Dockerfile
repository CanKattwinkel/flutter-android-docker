# 1. Build the image locally:
# docker build -t flutter-android .
# 2. Build inside the image locally (e.g. test CI on local device)
# docker run -v /home/can/hdm/morphing-interior/mi_client:/app -it flutter-android

FROM  javiersantos/android-ci:28.0.2

MAINTAINER kattwinkel@w11k.de

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
      xz-utils \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV FLUTTER_VERSION v0.11.13-beta

WORKDIR /

RUN curl -O https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_$FLUTTER_VERSION.tar.xz
RUN tar xf flutter_linux_$FLUTTER_VERSION.tar.xz
ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin

RUN flutter doctor

