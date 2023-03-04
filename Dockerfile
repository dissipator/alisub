FROM looby/aliyundrive-subscribe:latest
#ADD app.ini /app/conf/

EXPOSE 8022

CMD ["/app/aliyundrive-subscribe"]