# ELK Stack Homework Assignment

Выполнение практического задания по установке и настройке ELK Stack.

## Задание 1: Elasticsearch
- Установлен и запущен Elasticsearch
- Параметр `cluster_name` изменен на `my_random_cluster_12345`

### Команда для проверки:
```bash
curl -X GET 'localhost:9200/_cluster/health?pretty'

<img width="662" height="447" alt="1" src="https://github.com/user-attachments/assets/728513a9-303b-4250-a3f8-102651645fc0" />

Задание 2: Kibana
Установлен и запущен Kibana

Выполнен запрос через Dev Tools console

Команда для проверки:
text
GET /_cluster/health?pretty

<img width="1280" height="708" alt="2" src="https://github.com/user-attachments/assets/600f1fa8-0e54-40f3-94ee-a72afcc9cef5" />

Задание 3: Logstash + Nginx
Настроена отправка access-логов Nginx в Elasticsearch через Logstash

Созданы тестовые логи Nginx

<img width="1279" height="858" alt="3" src="https://github.com/user-attachments/assets/7cefc994-c021-4455-ae23-a50e36dbede4" />

<img width="1275" height="784" alt="3 1" src="https://github.com/user-attachments/assets/d396b1c9-88be-4db1-8098-5b24254aadd2" />


Задание 4: Filebeat
Настроена поставка логов Nginx через Filebeat

Логи успешно отображаются в Kibana

<img width="1283" height="733" alt="4" src="https://github.com/user-attachments/assets/0ffc0108-a392-4da3-8b7a-adb17d296bbc" />


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
