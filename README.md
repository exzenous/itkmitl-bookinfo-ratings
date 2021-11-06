# Bookinfo Rating Service

**Rating Service** has been *developed* on NodeJS

## License

MIT License

## How to run

```bash
node ratings.js 8080
```

## How to run with Docker

```bash
# Build Docker Image for rating service
docker build -t ratings .

# Run MongoDB with initial data in database
docker run -d --name mongodb -p 27017:27017 \
  -v $(pwd)/databases:/docker-entrypoint-initdb.d bitnami/mongodb:5.0.2-debian-10-r2

# Run ratings service on port 8080
docker run -d --name ratings -p 8080:8080 --link mongodb:mongodb \
  -e SERVICE_VERSION=v2 -e 'MONGO_DB_URL=mongodb://mongodb:27017/ratings' ratings
```

* Test with path `/ratings/1` and `/health`

## How to run with Docker Compose

```bash
docker-compose up
```

## How to run with Kubernetes

```bash
kubectl apply -f k8s/
```

## How to run service with MongoDB via Helm

- Add Bitnami's MongoDB Repo
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

- Create MongoDB Password
```bash
kubectl create secret generic bookinfo-dev-ratings-mongodb-secret \
  --from-literal=mongodb-password=CHANGEME \
  --from-literal=mongodb-root-password=CHANGEME
```

- Create initial script with Config Map
```bash
kubectl create configmap bookinfo-dev-ratings-mongodb-initdb \
  --from-file=databases/ratings_data.json \
  --from-file=databases/script.sh
```

- Run
```bash
helm install -f k8s/helm-values/values-bookinfo-dev-ratings-mongodb.yaml \
  bookinfo-dev-ratings-mongodb bitnami/mongodb --version 10.28.4
```


## Website

[Opsta (Thailand) Co., Ltd.](https://www.opsta.co.th)
