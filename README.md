# Fullstack-docker
En este repo, se encuentra el archivo bash necesario para desplegar un fullstack (frontend, backend, db, mongo-express).
Este ejercicio es parte del segundo reto (https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza) de la [Clase 3 y 4](https://www.youtube.com/live/TSaGCXsyVU4?si=qOZiYKkMzcpQVv0x) de [IV Edicion Bootcamp DevOps 2023](https://www.youtube.com/playlist?list=PLNkefP1xaOeyTQuNnd6HYVPqCWMXn-c5P).

<p align="center">
  <img src="https://github.com/Gastunchy/fullstack-docker/assets/97688245/2bb638d0-2ed9-4eaa-a9cc-4eadea69d9d2">
</p>

# Arquitectura:
Esta aplicación consta de tres componentes principales:
1. Frontend en Node.js y Express: Este componente sirve contenido web en el puerto 3000. Deberás crear un Dockerfile para el frontend, construir la imagen y publicarla en Docker Hub.
2. Backend en TypeScript: Este componente se ejecuta en el puerto 5000 y se conecta a una base de datos MongoDB. Deberás crear un Dockerfile para el backend, construir la imagen y publicarla en Docker Hub.
3. Base de Datos MongoDB: La base de datos se iniciará a través de un contenedor de MongoDB. Además, deberás proporcionar un archivo mongo-init.js que cargue datos iniciales en la base de datos cuando se inicie el contenedor de MongoDB.

Fuente: [295topics-fullstack](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza/295topics-fullstack)https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza/295topics-fullstack

## Detalle de Deploy.sh:
1. Solicita ingresar datos para las variables "dbuser" "dbpass" "expressuser" "expresspass"
   - Las dos primeras variables son el usuario y password de la base de datos (se sugiere un pass alfanumerico)
   - Las dos seguntas variables son el usuario y contraseña para ingresar a mongo-express
3. Valida e instala: docker.io, docker-compose, git y curl
4. Clona el repo: [https://github.com/roxsross/bootcamp-devops-2023 // Branch: ejercicio2-dockeriza](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza)
5. Copia el contenido de 295devops-travel-lamp en public-html
6. Crea archivo init.sql
7. Cambia contenido de config.php
8. Ejecuta docker-compose up -d
