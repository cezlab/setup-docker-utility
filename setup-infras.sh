DIR="./.docker"
FILE_NGINX="./.docker/nginx.conf.dist"
FILE_PHP="./.docker/php.ini.dist"
FILE_MYSQL="./.docker/mysql.cnf.dist"
FILE_DOCKER_COMPOSE="./docker-compose.yml"
FILE_MAKEFILE="./Makefile"
FILE_DOCKER_ENV="./.docker/.docker.env"
FILE_GITIGNORE=".gitignore"
DOWNLOAD_URL="https://raw.githubusercontent.com/cezlab/setup-docker-utility/main"

echo "#1 - Check Folder Docker Configuration"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "${DIR} directory exists"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} directory does not exists - Create ${DIR}"
  mkdir $DIR
fi

echo "#2 - Check ${FILE_DOCKER_COMPOSE} file"
if test -f "$FILE_DOCKER_COMPOSE"; then
    echo "$FILE_DOCKER_COMPOSE exists."
else
    echo "Download ${FILE_DOCKER_COMPOSE}"
    curl "${DOWNLOAD_URL}/docker-compose.yml" --output ${FILE_DOCKER_COMPOSE}
fi

echo "#3 - Check ${FILE_MAKEFILE} file"
if test -f "$FILE_MAKEFILE"; then
    echo "$FILE_MAKEFILE exists."
else
    echo "Download ${FILE_MAKEFILE}"
    curl "${DOWNLOAD_URL}/Makefile" --output ${FILE_MAKEFILE}
fi

echo "#4 - Check ${FILE_NGINX} file"
if test -f "$FILE_NGINX"; then
    echo "$FILE_NGINX exists."
else
    echo "Download ${FILE_NGINX}"
    curl "${DOWNLOAD_URL}/.docker/nginx.conf.dist" --output ${FILE_NGINX}
fi

echo "#5 - Check ${FILE_PHP} file"
if test -f "$FILE_PHP"; then
    echo "$FILE_PHP exists."
else
    echo "Download ${FILE_PHP}"
    curl "${DOWNLOAD_URL}/.docker/php.ini.dist" --output ${FILE_PHP}
fi

echo "#6 - Check ${FILE_MYSQL} file"
if test -f "$FILE_MYSQL"; then
    echo "$FILE_MYSQL exists."
else
    echo "Download ${FILE_MYSQL}"
    curl "${DOWNLOAD_URL}/.docker/mysql.cnf.dist" --output ${FILE_MYSQL}
fi

echo "#7 - Check ${FILE_DOCKER_ENV} file"
if test -f "$FILE_DOCKER_ENV"; then
    echo "$FILE_DOCKER_ENV exists."
else
    echo "Download ${FILE_MYSQL}"
    curl "${DOWNLOAD_URL}/.docker/.docker.env" --output ${FILE_DOCKER_ENV}
fi

echo "#8 - Check ${FILE_GITIGNORE} file"
if test -f "$FILE_GITIGNORE"; then
    echo "$FILE_GITIGNORE exists."
else
    echo "Write Content For ${FILE_GITIGNORE}"
    cat > $FILE_GITIGNORE <<EOF
.docker/mysql.cnf
.docker/nginx.conf
.docker/php.ini
.docker/.env
EOF
fi

