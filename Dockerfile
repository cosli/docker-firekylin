FROM node:5.11-slim
WORKDIR /firekylin
RUN echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && npm install \
    && npm install -g pm2
CMD ["pm2","start","pm2.json"]

