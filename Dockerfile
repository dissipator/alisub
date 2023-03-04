#FROM looby/aliyundrive-subscribe:latest
FROM golang:alpine as build

RUN apk update && apk add \
    wget curl jq
#     git make upx \
#     && rm -rf /var/lib/apt/lists/*

WORKDIR /app
# COPY . .

# RUN rm -rf out

# RUN make build

# RUN upx --ultra-brute out/render-template
RUN mkdir -p /app/conf && cd /app
# RUN latest=$(curl -sL https://api.github.com/repos/adminpass/aliyundrive-subscribe/releases/latest | jq -r ".tag_name") && \
RUN latest=V2.8.1_20221207 && \
    wget https://github.com/adminpass/aliyundrive-subscribe/releases/download/$latest/aliyundrive-subscribe_linux_amd64
RUN ls -l /app
FROM golang:alpine
ENV PASSWD=admin
WORKDIR /app
RUN mkdir -p /app/conf && cd /app
COPY --from=build /app/aliyundrive-subscribe_linux_amd64 /app/aliyundrive-subscribe
RUN chmod +x /app/aliyundrive-subscribe
ADD app.ini /app/conf/
RUN sed -e "s/app-auth-pass      = admin/app-auth-pass      = $PASSWD/g" conf/app.ini && cat conf/app.ini

EXPOSE 8022

#CMD ["/app/aliyundrive-subscribe"]

ENTRYPOINT  ["/app/aliyundrive-subscribe"]