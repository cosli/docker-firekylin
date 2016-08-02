#/bin/bash
if [ -d /firekylin/node_modules_useless ]
then
    rm -rf /firekylin/node_modules_useless
fi
if [ -d /firekylin/node_modules ]
then
    mv /firekylin/node_modules /firekylin/node_modules_useless
    cp -r /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
else
    cp -r /node_modules /firekylin/node_modules
    pm2 start /firekylin/pm2.json
fi
