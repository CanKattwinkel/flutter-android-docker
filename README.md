# Flutter Android Docker (API 28)

Based on [`javiersantos/android-ci:28.0.3`](https://github.com/javiersantos/android-ci/).

## Building and running

```
docker build -t flutter-android .
docker run -it --entrypoint=/bin/bash flutter-android
```

## Use in Gitlab

This image can be used to test and build Android APKs developed with Flutter.
Here is an example `.gitlab-ci.yml`:

```
test app:
  image: kattwinkel/flutter-android
  stage: test
  script:
  - cd app
  - flutter test

build app:
  image: kattwinkel/flutter-android
  stage: build
  script:
    - cd app
    - flutter build apk
  artifacts:
    expire_in: 1 week
    paths:
    - app/build/app/outputs/apk/release/app-release.apk
```
