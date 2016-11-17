#!/usr/bin/env bash
set -e

images =$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/images.txt)
REPO=$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/local-registry-url.txt)
echo "downloading images from $REPO"

for image in images; do
  docker pull $REPO/$image
done
