#!/usr/bin/env bash
set -e

images=$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/images.txt)
REPO=$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/local-registry-url.txt)

for image in images; do
  echo "Removing image for $image"
  docker rmi $REPO/$image
  docker rmi $image
done
