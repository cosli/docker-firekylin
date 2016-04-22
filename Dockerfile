FROM node:5.11-slim
WORKDIR /
RUN echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://github.com/75team/firekylin/blob/master/package.json \
    && npm install \
    && npm install -g pm2 
WORKDIR /firekylin
CMD ["mv","/node_modules","/firekylin/node_modules"]
ENTRYPOINT ["pm2","start","pm2.json"]

