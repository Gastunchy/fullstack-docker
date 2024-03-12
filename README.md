# Fullstack-docker
En este repo, se encuentra el archivo bash necesario para desplegar un fullstack (frontend, backend, db, mongo-express).
![image](https://github.com/Gastunchy/fullstack-docker/assets/97688245/2bb638d0-2ed9-4eaa-a9cc-4eadea69d9d2)

# Arquitectura:
Esta aplicación consta de tres componentes principales:
1. Frontend en Node.js y Express: Este componente sirve contenido web en el puerto 3000. Deberás crear un Dockerfile para el frontend, construir la imagen y publicarla en Docker Hub.
2. Backend en TypeScript: Este componente se ejecuta en el puerto 5000 y se conecta a una base de datos MongoDB. Deberás crear un Dockerfile para el backend, construir la imagen y publicarla en Docker Hub.
3. Base de Datos MongoDB: La base de datos se iniciará a través de un contenedor de MongoDB. Además, deberás proporcionar un archivo mongo-init.js que cargue datos iniciales en la base de datos cuando se inicie el contenedor de MongoDB.
