#/bin/bash
if [ -d /firekylin/node_modules ]
then
    pm2 start /firekylin/pm2.json
else
    mv /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
fi
