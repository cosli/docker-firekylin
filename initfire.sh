#/bin/bash
if [ -d /firekylin/node_modules ]
then
    mv /firekylin/node_modules /firekylin/node_modules_useless
    mv /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
else
    mv /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
fi
