# docker-firekylin
这是一个基于docker官方的node镜像（slim版本）构建的，可供运行firekylin的image。

# 主要工作
* 更改为CST时区
* 安装firekylin的依赖包
* 设置脚本自动检测firekylin目录内是否存在依赖包文件夹(node_modules)，不存在则将镜像内的依赖包mv过去

# 使用方法

```
docker run -d -p 8360:8360 --restart=always --name=firekylin -v /usr/share/nginx/html/firekylin:/firekylin docker.io/cosli/docker-firekylin:V1.0 /bin/bash -c "/initfire.sh && while true; do ping 127.0.0.1; done"
```

其中`while true; do ping 127.0.0.1; done`是使initfire.sh内pm2转入后台之后，保持container为up状态。当然，也可以更改脚本为npm start 前台运行方式。

之后访问http://ip:8360即可。

## 配置nginx代理

更改配置如下：
```
server {
    listen 80;
    server_name cosli.cugbteam.org;
    root /usr/share/nginx/html/firekylin/www;
    set $node_port 8360;

    index index.js index.html index.htm;

#    location ^~ /.well-known/acme-challenge/ {
#      alias /Users/welefen/Develop/git/firekylin/ssl/challenges/;
#      try_files $uri = 404;
#    }

    location / {
        proxy_http_version 1.1;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://127.0.0.1:$node_port$request_uri;
        proxy_redirect off;
    }
    
    location = /development.js {
        deny all;
    }
    location = /testing.js {
        deny all;
    }

    location = /production.js {
        deny all;
    }

    location ~ /static/ {
        etag         on;
        expires      max;
    }

}   

```
