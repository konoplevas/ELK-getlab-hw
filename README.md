# ELK Stack Homework Assignment

Выполнение практического задания по установке и настройке ELK Stack.

## Задание 1: Elasticsearch
- Установлен и запущен Elasticsearch
- Параметр `cluster_name` изменен на `my_random_cluster_12345`

### Команда для проверки:
```bash
curl -X GET 'localhost:9200/_cluster/health?pretty'
Задание 2: Kibana
Установлен и запущен Kibana

Выполнен запрос через Dev Tools console

Команда для проверки:
text
GET /_cluster/health?pretty
Задание 3: Logstash + Nginx
Настроена отправка access-логов Nginx в Elasticsearch через Logstash

Созданы тестовые логи Nginx

Задание 4: Filebeat
Настроена поставка логов Nginx через Filebeat

Логи успешно отображаются в Kibana

Структура проекта
text
ELK-getlab-hw/
├── docker-files/          # Docker конфигурации
├── commands/             # Скрипты и команды
├── screenshots/          # Скриншоты выполнения
├── logs/                # Примеры логов
└── README.md           # Документация
Установка и запуск
Клонировать репозиторий

Запустить контейнеры: docker-compose -f docker-files/docker-compose-v7.yml up -d

Выполнить команды из commands/setup_commands.sh

Открыть Kibana: http://localhost:5601
