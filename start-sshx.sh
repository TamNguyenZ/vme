#!/bin/bash

# Keep container alive
(while true; do
    echo "[KEEPING CONTAINER ALIVE] $(date)"
    df -h | head -n5
    sleep 60
done) &

# Install SSHx
curl -sSf https://sshx.io/get | sh

# Run SSHx and output link
sshx > /dev/stdout 2>&1 &
echo "🚀 SSHx started!"
