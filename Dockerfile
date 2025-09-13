# Sử dụng Ubuntu mới nhất
FROM ubuntu:22.04

# 1️⃣ Cài các gói cần thiết
RUN apt-get update -y && \
    apt-get install -y curl coreutils && \
    rm -rf /var/lib/apt/lists/*

# 2️⃣ Tải SSHx về /usr/local/bin và cấp quyền thực thi
RUN curl -sSf https://sshx.io/get -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# 3️⃣ Khi container khởi động, chạy SSHx và vòng lặp keep-alive trực tiếp
CMD bash -c "\
  (while true; do \
     echo '[KEEPING CONTAINER ALIVE] ' \$(date); \
     df -h | head -n5; \
     sleep 60; \
   done) & \
  /usr/local/bin/sshx > /dev/stdout 2>&1 & \
  echo '🚀 SSHx started! Kiểm tra log để thấy link terminal.'; \
  wait"
