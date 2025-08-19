# felk-monitoring

## Tổng quan

Dự án này cung cấp giải pháp giám sát, backup và quản lý log cho hệ thống sử dụng các dịch vụ: Nginx, MySQL, WordPress, Elasticsearch, Kibana, Logstash. Tất cả được triển khai qua Docker Compose, hỗ trợ tự động hóa backup, logrotate và dashboard giám sát.

## Cấu trúc thư mục

```
logstash/
  logstash.conf
mysql/
  logrotate-mysql.conf
nginx/
  logrotate-nginx.conf
  nginx.conf
scripts/
  backup.sh
  cron.daily
  entrypoint-cronjob.sh
  README_BACKUP_LOGROTATE.md
wordpress/
  README.md
  setup-wordpress.sh
docker-compose.yml
KIBANA_DASHBOARD_GUIDE.md
```

## Chức năng chính

- **docker-compose.yml**: Khởi tạo toàn bộ stack dịch vụ, cấu hình volume, healthcheck, backup, logrotate.
- **logstash/logstash.conf**: Thu thập log từ Nginx, MySQL, WordPress, chuyển về Elasticsearch.
- **nginx/nginx.conf**: Cấu hình reverse proxy cho WordPress.
- **mysql/logrotate-mysql.conf** & **nginx/logrotate-nginx.conf**: Tự động xoay log MySQL/Nginx hàng ngày.
- **scripts/backup.sh**: Script backup MySQL và Elasticsearch.
- **scripts/cron.daily**: Script tự động logrotate & backup mỗi ngày (dùng cho cronjob).
- **scripts/entrypoint-cronjob.sh**: Entrypoint cho container cronjob.
- **scripts/README_BACKUP_LOGROTATE.md**: Hướng dẫn chi tiết backup & logrotate.
- **wordpress/setup-wordpress.sh**: Script tự động cài đặt WordPress khi container lần đầu chạy.
- **KIBANA_DASHBOARD_GUIDE.md**: Hướng dẫn tạo dashboard mẫu trên Kibana.

## Hướng dẫn sử dụng nhanh

1. **Khởi động toàn bộ hệ thống:**

   ```sh
   docker-compose up -d
   ```

2. **Truy cập các dịch vụ:**

   - WordPress: http://localhost
   - Kibana: http://0.0.0.0:5601

3. **Backup & logrotate:**

   - Được tự động hóa qua cronjob (xem `scripts/cron.daily`).
   - Có thể chạy backup thủ công:
     ```sh
     bash scripts/backup.sh /duongdan/backup
     ```

4. **Tạo dashboard trên Kibana:**
   - Xem hướng dẫn chi tiết trong `KIBANA_DASHBOARD_GUIDE.md`.

## Lưu ý

- Đảm bảo các biến môi trường (MySQL, Elasticsearch, WordPress) được cấu hình đúng.
- Thư mục backup cần đủ quyền ghi và dung lượng.
- Có thể mở rộng thêm các script hoặc dashboard tuỳ nhu cầu.

---

_File này được sinh tự động bằng Repomix, tổng hợp toàn bộ cấu trúc và chức năng chính của repository._
