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
