REPO=$(cat local-registry-url)
images = $(cat images.txt)
for image in images; do
  docker pull $image
  docker tag $image $repo/$image
  docker push $repo/$image
done
