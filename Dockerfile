# 1. Build the image locally:
# docker build -t flutter-android .
# 2. Build inside the image locally (e.g. test CI on local device)
# docker run -v /home/can/hdm/morphing-interior/mi_client:/app -it flutter-android

FROM  javiersantos/android-ci:28.0.3

MAINTAINER kattwinkel@w11k.de

RUN apt-get -qq update && \
  apt-get install -qqy --no-install-recommends \
  xz-utils \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yes | sdk/tools/bin/sdkmanager --licenses

# Updating build tools to meet flutter requirements 
RUN /sdk/tools/bin/sdkmanager "platforms;android-28" "build-tools;28.0.3"

ENV FLUTTER_VERSION v1.5.4-hotfix.2-stable

WORKDIR /

RUN curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_$FLUTTER_VERSION.tar.xz
RUN tar xf flutter_linux_$FLUTTER_VERSION.tar.xz
ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin

RUN yes | flutter doctor --android-licenses
RUN flutter doctor
