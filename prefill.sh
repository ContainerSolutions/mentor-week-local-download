repo=$(cat local-registry-url.txt)
images=$(cat images.txt)
for image in $images; do
  docker pull $image
  docker tag $image $repo/$image
  docker push $repo/$image
done
