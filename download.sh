#!/usr/bin/env bash
set -e

images=$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/images.txt)
REPO=$(curl https://raw.githubusercontent.com/ContainerSolutions/mentor-week-local-download/master/local-registry-url.txt)
echo "downloading images from $REPO"

existing_images=$(docker images --format "{{.Repository}}:{{.Tag}}")

for image in $images; do
  echo "Pulling image $image"
  docker pull $REPO/$image
  existing_images=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep "^$image")

  for existing_image in existing_images; do
    docker rmi $existing_image
  done

  docker tag $REPO/$image $image
done
