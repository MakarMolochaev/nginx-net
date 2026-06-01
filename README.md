# nginx-net
Тестовое задание

### Цепочки  
nginx1 > nginx2 > nginx3 > app  
nginx4 > app

### Тестирование с помощью curl  

Запрос на nginx1  
```curl -s http://localhost:8081 | jq '."X-Forwarded-For"'```

Запрос на nginx2  
```curl -s http://localhost:8082 | jq '."X-Forwarded-For"'```

и так далее. порт для nginxN = 808N

Проверка подмены заголовка  
```curl -s -H "X-Forwarded-For: 1.2.3.4" http://localhost:8081 | jq '."X-Forwarded-For"'```