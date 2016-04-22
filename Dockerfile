FROM node:5.11-slim
WORKDIR /
RUN echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://raw.githubusercontent.com/75team/firekylin/master/package.json \
    && npm install \
    && npm install -g pm2 
WORKDIR /firekylin
ENTRYPOINT ["mv","/node_modules","/firekylin/node_modules"]
#CMD ["pm2","start","pm2.json"]

