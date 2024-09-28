image="harbor.mereith.com/library/chinese-holiday-api"
tag="latest"

docker build -t ${image}:${tag} .
docker push ${image}:${tag}
