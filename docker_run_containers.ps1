docker run --name mysql -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes `
    -e MYSQL_DATABASE=microblog -e MYSQL_USER=microblog `
    -e MYSQL_PASSWORD=<database-password> `
    --network microblog-network `
    mysql:latest

docker run --name elasticsearch -d --rm -p 9200:9200 `
    -e discovery.type=single-node -e xpack.security.enabled=false `
    --network microblog-network `
    -t docker.elastic.co/elasticsearch/elasticsearch:8.11.1

docker run --name microblog -d -p 8000:5000 --rm -e SECRET_KEY=my-secret-key `
    --network microblog-network `
    -e DATABASE_URL=mysql+pymysql://microblog:<database-password>@mysql/microblog `
    -e ELASTICSEARCH_URL=http://elasticsearch:9200 `
    microblog:latest