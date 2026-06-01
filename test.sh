echo "Request to nginx 1:"
curl -s http://localhost:8081 | jq '."X-Forwarded-For"'
echo "Request to nginx 2:"
curl -s http://localhost:8082 | jq '."X-Forwarded-For"'
echo "Request to nginx 3:"
curl -s http://localhost:8083 | jq '."X-Forwarded-For"'
echo "Request to nginx 4:"
curl -s http://localhost:8084 | jq '."X-Forwarded-For"'