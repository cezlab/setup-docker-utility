# How to use 
## Download setup
``` 
curl https://raw.githubusercontent.com/cezlab/setup-docker-utility/magento/setup-php.sh --output setup-php.sh && chmod +x setup-php.sh 
curl https://raw.githubusercontent.com/cezlab/setup-docker-utility/magento/setup-infras.sh --output setup-infras.sh && chmod +x setup-infras.sh 
```
## Run Docker Compose
``` 
docker-compose --env-file ./.docker/.env up
```
