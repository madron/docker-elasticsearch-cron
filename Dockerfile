FROM python:2.7
MAINTAINER Massimiliano Ravelli <massimiliano.ravelli@gmail.com>


# Cron
RUN    apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

# Eleasticsearch curator
RUN pip install elasticsearch-curator==2.0.0

RUN rm /etc/crontab
COPY docker /docker

ENV CRON_FREQUENCY="25 6 * * *"
ENV OLDER_THAN="20"

ENTRYPOINT ["/docker/entrypoint.sh"]
CMD ["cron"]
