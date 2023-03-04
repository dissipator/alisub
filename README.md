# alisub
  注意免费的render 无持久化，重启应用数据库会丢失；请自行配置mysql作为后端存储！！
# aliyundrive-subscribe

【阿里云盘订阅】，主要用于云盘分享链最新资源转存、重命名、下载、资源管理等

# 用[render](https://dashboard.render.com/)来部署aliyundrive-subscribe
 1. fork 本仓库，
 2. 创建render 账号授权 github仓库
 3. 创建web应用 选择fork的仓库
 4. 修改配置 写一个app.ini的Secret Files后再次部署
 
# 将配置文件写入Secret Files 即可；
![image](https://user-images.githubusercontent.com/5356375/222882242-d2271639-c139-43c7-b234-28acaba1a61f.png)

配置说明：
config/app.ini
```ini
[app]
app-http-port      = 8002
# 用户名
app-auth-user      = admin
# 密码
app-auth-pass      = admin
# 数据库 (mysql/sqlite3) mysql root:pass@tcp(ip:port)/database?charset=utf8&parseTime=True&loc=Local
app-database       = conf/data.db
# 订阅检查周期: @every 30m(30分钟); @every 1h(1小时) - 不要太频繁
app-check-interval = @every 30m
# 订阅检查并发数
app-max-procs      = 10
# 缓存，在线播放m3u8资源目录, 会4小时自动清除
app-cache-dir      = conf/cache
# 钉钉机器人通知
app-dingding-robot = [app-dingding-robot]
# 钉钉机器人附带外链播放地址, 为当前服务访问地址
app-play-url       = http://10.0.1.18:8002
# 腾讯HiFlow通知
app-notify-hiflow  = https://api.hiflow.tencent.com/engine/webhook/31/1597044003551531111

[aliyundrive]
# 云盘refresh-token
aliyundrive-refresh-token = [refresh-token]
# 云盘资源根目录（默认root），建议设置一个单独目录
aliyundrive-root          = root

[aria2rpc]
# aria2地址（仅支持http）
aria2-rpc-url          = http://10.0.1.14:6800/jsonrpc
# aria2秘钥，没有留空
aria2-rpc-secret       = P3TERX
# aria2下载根目录，所有下载都在这个目录下
aria2-rpc-download-dir = /downloads
# aria2是否启用下载
aria2-rpc-enable       = false
```

### 最新记录

1. 使用的是v2.8.1版本的aliyundrive-subscribe 因为最版的docker和二进制运行有问题。
2. 升级到 V2.8.2_20230303


## 免责声明
1. 本软件为免费开源项目，无任何形式的盈利行为。
2. 本软件服务于阿里云盘，旨在让阿里云盘功能更强大。如有侵权，请与我联系，会及时处理。
3. 本软件皆调用官方接口实现，无任何“Hack”行为，无破坏官方接口行为。
5. 本软件仅做流量转发，不拦截、存储、篡改任何用户数据。
6. 严禁使用本软件进行盈利、损坏官方、散落任何违法信息等行为。
7. 本软件不作任何稳定性的承诺，如因使用本软件导致的文件丢失、文件破坏等意外情况，均与本软件无关。

## 感谢开发者 [adminpass](https://github.com/adminpass/aliyundrive-subscribe) 
