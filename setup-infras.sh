DIR="./.docker"
echo "#1 - Check Folder Docker Configuration"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "${DIR} directory exists"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} directory does not exists - Create ${DIR}"
  mkdir $DIR
fi