# Hướng dẫn backup & logrotate cho hệ thống

## 1. Healthcheck (docker-compose.yml)

- Đã bổ sung healthcheck cho các service: nginx, web, db, elasticsearch, kibana, logstash.

## 2. Logrotate & Tự động hóa bằng cronjob

- Đã tạo file cấu hình logrotate cho Nginx: `nginx/logrotate-nginx.conf`
- Đã tạo file cấu hình logrotate cho MySQL: `mysql/logrotate-mysql.conf`
- Đã tạo script tự động hóa logrotate và backup: `scripts/cron.daily`
- Để tự động xoay log và backup mỗi ngày, hãy:
  1. Đảm bảo cài đặt logrotate trong container hoặc host.
  2. Mount các file cấu hình logrotate vào đúng vị trí trong container (ví dụ: `/etc/logrotate-nginx.conf`, `/etc/logrotate-mysql.conf`).
  3. Mount script `scripts/backup.sh` và thư mục backup vào container nếu chạy trong Docker.
  4. Thêm cronjob chạy mỗi ngày 1 lần, ví dụ trên host Linux:
  ```sh
  # Copy script vào /etc/cron.daily hoặc tạo cronjob thủ công:
  cp scripts/cron.daily /etc/cron.daily/felk-monitoring
  chmod +x /etc/cron.daily/felk-monitoring
  # Hoặc dùng crontab:
  0 2 * * * /bin/bash /path/to/scripts/cron.daily
  ```
  5. Script sẽ tự động xoay log Nginx, MySQL và backup dữ liệu mỗi ngày.

## 3. Backup dữ liệu

- Đã tạo script backup: `scripts/backup.sh` (được gọi tự động bởi `scripts/cron.daily`)
- Script này sẽ backup MySQL (dùng mysqldump) và Elasticsearch (dùng snapshot API).
- Có thể chạy thủ công:
  ```sh
  bash scripts/backup.sh /duongdan/backup
  ```
  hoặc để cronjob tự động thực hiện mỗi ngày.

## 4. Lưu ý

- Đảm bảo thư mục backup có đủ quyền ghi và dung lượng.
- Kiểm tra lại biến môi trường khi chạy backup (MySQL, Elasticsearch).
- Có thể mở rộng script backup cho các service khác nếu cần.
