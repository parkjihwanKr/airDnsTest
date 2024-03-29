#!/usr/bin/env bash

echo "> ci/cd test!"

# 명령어가 bash 환경에서 실행됨을 명시해줍니다.
APP_NAME="air_dns_test"
REPOSITORY="/home/ubuntu/"

echo "> ${APP_NAME} + ${REPOSITORY}"
echo "> Check the currently running container"
CONTAINER_ID=$(docker ps -aqf "name=$APP_NAME")

# 도커 이미지 및 컨테이너 이름과, 빌드 파일의 경로를 변수로 적어줍니다.
if [ -z "$CONTAINER_ID" ]; then
  echo "> No such container is running."
else
  echo "> Stop and remove container: $CONTAINER_ID"
  docker stop "$CONTAINER_ID"
  docker rm "$CONTAINER_ID"
fi

echo "> Remove previous Docker image"
docker rmi "$APP_NAME"

# docker compose build
# 여기 어디서 jar파일 찾기 -> target?
echo "> Build Docker image"
docker build -t "$APP_NAME" "$REPOSITORY"

echo "> Run the Docker container"
docker run -d -p 3000:8080 --name "$APP_NAME" "$APP_NAME"