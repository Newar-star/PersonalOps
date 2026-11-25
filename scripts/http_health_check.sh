#!/bin/bash
read -p "Введите полную адресную строку сайта: " URL
http_code=$(curl -s -L -o /dev/null -w "%{http_code}" $URL)
Response_time=$(curl -s -L -o /dev/null -w "%{time_total}" $URL)
echo "URL: $URL"
if [[ $http_code -ge 200 && $http_code -lt 400 ]]
then
echo "Status: UP"
echo "HTTP Code = $http_code"
elif [[ $http_code -ge 400 && $http_code -lt 600 ]]
then
echo "Status: DOWN"
echo "HTTP Code = $http_code"
fi
echo "Response time: $Response_time"
