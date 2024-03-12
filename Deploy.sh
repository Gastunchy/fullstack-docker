#! /bin/bash
# Autor: Gaston D. Farias

# Colores
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
BMAGENTA='\033[1;35m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'
NC='\033[0m'

# Variables

variables=("dbuser" "dbpass" "expressuser" "expresspass")

for var in "${variables[@]}"; do
  if [ -z "${!var}" ]; then
    echo -e "\n${BRED}La variable ${var} no está definida.${NC}"
    read -p "Ingrese un dato para ${var}: " input
    declare "${var}=${input}"
    echo -e "\n${BGREEN}Variable definida:${NC} ${!var}"
  fi
done

declare > ".env"

USERID=$(id -u)
APP=("git" "docker.io" "docker-compose" "curl")

# Validacion de usuario root

if [ "${USERID}" -ne 0 ]; then
    echo -e "\n${BRED}Correr con usuario ROOT.${NC}"
    exit
fi

# Actualizacion de servidor e instalacion de git, docker.io, docker-compose, curl

echo "Actualizacion servidor"
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "\n${BGREEN}apt-get update ejecutado correctamente.${NC}"
else
    echo -e "\n${BRED}Error: apt-get update fallo.${NC}"
    exit 1
fi

echo "instalacion de git, docker.io, docker-compose, curl"

for APP in "${APP[@]}"; do
    dpkg -l | grep -q $APP
    if [ $? -eq 0 ]; then
        echo " $APP ya esta instalado"
    else
        echo "Instalando $APP ..."
        sudo apt-get install -y $APP > /dev/null 2>&1
    fi
done

echo "Clonando repo"

git clone https://github.com/roxsross/bootcamp-devops-2023.git -b ejercicio2-dockeriza

rm -rf ./bootcamp-devops-2023/295devops-travel-lamp
rm -rf ./bootcamp-devops-2023/295words-docker

cat > ./bootcamp-devops-2023/295topics-fullstack/backend/Dockerfile <<- EOF
FROM node:21-bullseye

ENV DATABASE_URL=mongodb://${dbuser}:${dbpass}@mongodb:27017
ENV DATABASE_NAME=TopicstoreDb
ENV HOST=backend
ENV PORT=5000

WORKDIR /home/node/app

COPY . .
RUN apt-get update \
&& apt-get install -y npm \
&& npm install \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 5000

CMD [ "npm", "start" ]
EOF

cat > ./bootcamp-devops-2023/295topics-fullstack/frontend/Dockerfile <<- EOF
FROM node:21-bullseye

ENV API_URI=http://backend:5000/api/topics

WORKDIR /app
COPY . .
RUN apt-get update \
&& apt-get install -y npm \
&& npm install \
&& npm install ts-node \
&& rm -rf /var/lib/apt/lists/*

EXPOSE 3000

CMD [ "npm", "start" ]

EOF

cat > docker-compose.yml <<-EOF
version: '3'

services:
    mongodb:
        image: mongo
        restart: always
        container_name: mongodb
        environment:
            MONGO_INITDB_ROOT_USERNAME: \$dbuser
            MONGO_INITDB_ROOT_PASSWORD: \$dbpass
        ports:
            - '27017:27017'
        volumes:
            - ./bootcamp-devops-2023/295topics-fullstack/db:/docker-entrypoint-initdb.d
        networks:
            - base
            - back
    mongo-express:
        image: mongo-express:1.0.2-20-alpine3.19
        container_name: mongo-express
        depends_on:
            - mongodb
        environment:
            ME_CONFIG_BASICAUTH_USERNAME: \$expressuser
            ME_CONFIG_BASICAUTH_PASSWORD: \$expresspass
            ME_CONFIG_MONGODB_ENABLE_ADMIN: 'true'
            ME_CONFIG_MONGODB_ADMINUSERNAME: \$dbuser
            ME_CONFIG_MONGODB_ADMINPASSWORD: \$dbpass
            ME_CONFIG_MONGODB_PORT: 27017
            ME_CONFIG_MONGODB_SERVER: mongodb
        ports:
            - '8081:8081'
        networks:
            - base
    backend:
        build: ./bootcamp-devops-2023/295topics-fullstack/backend
        container_name: backend
        depends_on:
            - mongodb
        networks:
            - back
        ports:
            - "5000:5000"
    frontend:
        build: ./bootcamp-devops-2023/295topics-fullstack/frontend
        container_name: frontend
        depends_on:
            - backend
        networks:
            - back
        ports:
            - "3000:3000"
networks:
    base:
        driver: bridge
    back:
        driver: bridge
EOF

docker-compose up -d
