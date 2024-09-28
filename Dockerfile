# 使用官方的 Go 语言镜像作为基础镜像
FROM golang:1.20-alpine

# 设置工作目录
WORKDIR /app

COPY go.mod  ./

# 下载依赖
RUN go mod download

# 复制源代码
COPY . .

# 编译 Go 程序
RUN go build -o chinese-holiday-api

# 使用一个更小的镜像来运行应用程序
FROM alpine:latest

# 设置工作目录
WORKDIR /root/

# 复制编译好的二进制文件
COPY --from=0 /app/chinese-holiday-api .

# 暴露端口
EXPOSE 8080

# 运行应用程序
CMD ["./chinese-holiday-api"]
