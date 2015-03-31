# What is elasticsearch-cron?

Just a cron script to cleanup an elasticsearch container

> [Elasticsearch curator](http://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html)

# How to use this image

Run `elasticsearch`:

    docker run -d --name elasticsearch elasticsearch:1.5.0

Run `elasticsearch-cron`:

    docker run -d --name elasticsearch-cron --link elasticsearch:elasticsearch -e OLDER_THAN=30 madron/elasticsearch-cron
