FROM node:5.11.0-slim
WORKDIR /firekylin
RUN npm install \
    && npm install -g pm2
CMD ["pm2","start","pm2.json"]

