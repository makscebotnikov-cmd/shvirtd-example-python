#!/bin/bash
# Разворачивает проект из МОЕГО форка в /opt и запускает его целиком.
# Использование:  sudo bash deploy.sh
set -euo pipefail

REPO_URL="https://github.com/makscebotnikov-cmd/shvirtd-example-python.git"
TARGET_DIR="/opt/shvirtd-example-python"

if [ -d "$TARGET_DIR/.git" ]; then
  echo ">>> Репозиторий уже есть, обновляю: $TARGET_DIR"
  git -C "$TARGET_DIR" pull --ff-only
else
  echo ">>> Клонирую $REPO_URL в $TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
fi

cd "$TARGET_DIR"
echo ">>> Запускаю проект"
docker compose up -d --build

echo ">>> Состояние контейнеров"
docker compose ps
