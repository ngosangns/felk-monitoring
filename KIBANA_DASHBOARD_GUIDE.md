# Hướng dẫn tạo Dashboard mẫu trên Kibana

## 1. Nginx Access Log

- **Index pattern:** `nginx_access-*`
- **Các visualizations:**
  - Pie chart: Top 10 quốc gia truy cập (`geoip.country_name`)
  - Data table: Top 10 IP truy cập (`remote_addr`)
  - Bar chart: Số lượng truy cập theo status code (`status`)
  - Line chart: Lưu lượng truy cập theo thời gian
  - Data table: Top 10 URL truy cập (`request`)

## 2. Nginx Error Log

- **Index pattern:** `nginx_error-*`
- **Các visualizations:**
  - Data table: Thống kê lỗi theo message
  - Line chart: Số lượng lỗi theo thời gian

## 3. MySQL Slow Query Log

- **Index pattern:** `mysql_slow-*`
- **Các visualizations:**
  - Data table: Truy vấn chậm (`slow_query`)
  - Line chart: Số lượng truy vấn chậm theo thời gian

## 4. MySQL Error Log

- **Index pattern:** `mysql_error-*`
- **Các visualizations:**
  - Data table: Thống kê lỗi
  - Line chart: Số lượng lỗi theo thời gian

## 5. WordPress Log

- **Index pattern:** `wordpress-*`
- **Các visualizations:**
  - Data table: Thống kê truy cập, lỗi
  - Line chart: Số lượng truy cập/lỗi theo thời gian

---

## Các bước thực hiện

1. Vào Kibana (http://localhost:5601)
2. Tạo Index Pattern tương ứng với từng loại log
3. Vào mục Dashboard, tạo dashboard mới, thêm các visualizations theo gợi ý trên
4. Lưu dashboard để theo dõi realtime

Bạn có thể tuỳ biến thêm các filter, search, hoặc alert theo nhu cầu thực tế.
