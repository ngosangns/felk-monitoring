# Hướng dẫn cài đặt WordPress thủ công qua script

Sau khi chạy `docker-compose up -d`, bạn có thể vào container để chạy script tự động cài đặt WordPress:

```sh
docker-compose exec web bash /var/www/html/setup-wordpress.sh
```

Sau đó truy cập http://localhost:8080 để hoàn tất cài đặt qua giao diện web.
