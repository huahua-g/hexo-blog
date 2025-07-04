#!/bin/bash

echo "🚀 开始拉取最新代码..."
git pull origin master

echo "🧹 清理旧容器（如果存在）..."
docker rm -f blog || true

echo "🧱 开始构建 Docker 镜像..."
docker build -t hexo-blog .

echo "🚪 启动博客容器..."
docker run -d --name blog -p 80:80 hexo-blog

