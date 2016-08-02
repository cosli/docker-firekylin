#/bin/bash
if [ -d /firekylin/node_modules_useless ]
then
    rm -Rf /firekylin/node_modules_useless
fi
if [ -d /firekylin/node_modules ]
then
    mv /firekylin/node_modules /firekylin/node_modules_useless
    cp /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
else
    cp /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
fi
