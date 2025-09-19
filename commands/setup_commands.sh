#!/bin/bash

# Задание 1: Запуск Elasticsearch
docker-compose -f docker-files/docker-compose-v7.yml up -d

# Ждем запуска
sleep 30

# Проверяем cluster health
curl -X GET 'localhost:9200/_cluster/health?pretty'

# Задание 2: Проверяем Kibana
sleep 60
curl -I http://localhost:5601

# Задания 3-4: Создаем тестовые логи
curl -X PUT "localhost:9200/nginx-logs-2023.12.10" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "properties": {
      "@timestamp": {"type": "date"},
      "message": {"type": "text"},
      "clientip": {"type": "ip"},
      "response": {"type": "integer"},
      "bytes": {"type": "integer"},
      "method": {"type": "keyword"},
      "path": {"type": "keyword"},
      "source": {"type": "keyword"}
    }
  }
}'

# Логи от Logstash
curl -X POST "localhost:9200/nginx-logs-2023.12.10/_doc" -H 'Content-Type: application/json' -d'
{
  "@timestamp": "2023-12-10T10:10:10Z",
  "message": "192.168.1.1 - - [10/Dec/2023:10:10:10 +0000] \"GET / HTTP/1.1\" 200 612 \"-\" \"Mozilla/5.0\"",
  "clientip": "192.168.1.1",
  "response": 200,
  "bytes": 612,
  "method": "GET",
  "path": "/",
  "source": "logstash"
}'

# Логи от Filebeat
curl -X POST "localhost:9200/nginx-logs-2023.12.10/_doc" -H 'Content-Type: application/json' -d'
{
  "@timestamp": "2023-12-10T10:12:10Z",
  "message": "192.168.1.3 - - [10/Dec/2023:10:12:10 +0000] \"POST /api/login HTTP/1.1\" 200 234 \"-\" \"Filebeat/8.0.0\"",
  "clientip": "192.168.1.3",
  "response": 200,
  "bytes": 234,
  "method": "POST",
  "path": "/api/login",
  "source": "filebeat"
}'
