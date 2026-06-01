# nginx-net
Тестовое задание

### Как работает
Нжинксы слушают порты 80 и 81. порт 80 экспоузится, порт 81 - внутренний.  
Если запрос приходит на порт 81, то он доверенный, поэтому выполняесят ```$proxy_add_x_forwarded_for```.  
Если же запрос приходит на порт 80, то X-Forwarded-For устанавливается в ```$remote_addr```.  
Каждый nginx либо отправляет запрос на следующий nginx на порт 81, либо уже в приложение.  
Запросы от пользователя попадают только на порт 80 (прописано в docker compose).  
Тем самым реализуется защита от подстановки своих данных в заголовок X-Forwarded-For.

### Цепочки  
nginx1 > nginx2 > nginx3 > app  
nginx4 > app


### Запуск  

```docker compose up -d``` или ```docker-compose up -d```

### Тестирование с помощью curl  

Запрос на nginx1  
```curl -s http://localhost:8081 | jq '."X-Forwarded-For"'```

Запрос на nginx2  
```curl -s http://localhost:8082 | jq '."X-Forwarded-For"'```

и так далее. порт для nginxN = 808N

Проверка защиты от подмены заголовка  
```curl -s -H "X-Forwarded-For: 1.2.3.4" http://localhost:8081 | jq '."X-Forwarded-For"'```


Можно просто запустить test.sh для проверки всех nginx сразу.