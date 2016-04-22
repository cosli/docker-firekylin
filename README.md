# docker-firekylin
这是一个基于docker官方的node镜像（slim版本）构建的，可供运行firekylin的image。

# 主要工作
* echo "Asia/Shanghai" > /etc/timezone & dpkg-reconfigure -f noninteractive tzdata
* npm install pm2
* npm install (安装依赖包)
* CMD [pm2 start pm2.json]
