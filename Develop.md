docker build -t flutter-android .
docker tag flutter-android:latest kattwinkel/flutter-android
docker push kattwinkel/flutter-android
