# Fullstack-docker
En este repo, se encuentra el archivo bash necesario para desplegar un fullstack (frontend, backend, db, mongo-express).
Este ejercicio es parte del segundo reto (https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza) de la [Clase 3 y 4](https://www.youtube.com/live/TSaGCXsyVU4?si=qOZiYKkMzcpQVv0x) de [IV Edicion Bootcamp DevOps 2023](https://www.youtube.com/playlist?list=PLNkefP1xaOeyTQuNnd6HYVPqCWMXn-c5P).

<p align="center">
  <img src="https://github.com/Gastunchy/fullstack-docker/assets/97688245/b8f98fa8-c4a2-44d5-a45d-6c8a542b5c32)">
</p>

# Arquitectura:
Esta aplicación consta de tres componentes principales:
1. Frontend en Node.js y Express: Este componente sirve contenido web en el puerto 3000. Deberás crear un Dockerfile para el frontend, construir la imagen y publicarla en Docker Hub.
2. Backend en TypeScript: Este componente se ejecuta en el puerto 5000 y se conecta a una base de datos MongoDB. Deberás crear un Dockerfile para el backend, construir la imagen y publicarla en Docker Hub.
3. Base de Datos MongoDB: La base de datos se iniciará a través de un contenedor de MongoDB. Además, deberás proporcionar un archivo mongo-init.js que cargue datos iniciales en la base de datos cuando se inicie el contenedor de MongoDB.

Fuente: [295topics-fullstack](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza/295topics-fullstack)https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza/295topics-fullstack

# Detalle de Deploy.sh:
1. Solicita ingresar datos para las variables "dbuser" "dbpass" "expressuser" "expresspass"
   - Las dos primeras variables son el usuario y password de la base de datos (se sugiere un pass alfanumerico)
   - Las dos seguntas variables son el usuario y contraseña para ingresar a mongo-express
2. Valida e instala: docker.io, docker-compose, git y curl
3. Clona el repo: [[https://github.com/roxsross/bootcamp-devops-2023 // Branch: ejercicio2-dockeriza](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza)](https://github.com/roxsross/bootcamp-devops-2023/tree/ejercicio2-dockeriza/295topics-fullstack)
4. Elimina carpetas innecesarias: 295devops-travel-lamp y 295words-docker que no son necesarias para este proyecto
5. Crea un Dockerfile para el contenido backend
6. Crea un Dockerfile para el contenido frontend
7. Crea un docker-compose.yml para el desplieque completo de la solucion
8. Ejecuta "docker-compose up -d" para desplegar la solucion

## Detalle de docker-compose
- ### MongoDB
  1. Descarga imagen de mongoDB
  2. Carga configuracion inicial "mongo-init.js" que esta unbicado en la carpeta DB
  3. Crea contenedor con dos redes back (front, back y db) y base (db y mongo-express) 
- ### Backend
  1. Descarga imagen de node
  2. Ejecuta el archivo Dockerfile para crear la imagen del backend
  3. En la creacion de la imagen se copian todos los archivos de la app backend
  4. Crea contenedor en red back con node e instala modulos necesarios y expone puerto 5000
- ### frontend
  1. Descarga imagen de node
  2. Ejecuta el archivo Dockerfile para crear la imagen del backend
  3. En la creacion de la imagen se copian todos los archivos de la app frontend
  4. Crea contenedor en red back con node e instala modulos necesarios y expone puerto 3000
- ### Mongo-express
  1. Descarga imagen mongo-express
  2. Crea contenedor en red base expone puerto 3000

## Informacion extra
- los contenedores bakend, frontend y db tienen que estar si o si en la misma red
- Los contenedores de db y mongo-express tienen que estar en la misma red
- Tanto el script como los archivos docker estan testeados en UBUNTU
- Pueden testear en https://killercoda.com/playgrounds/scenario/ubuntu

## Ejecusion sugerida
1. Clonar este repo ([https://github.com/Gastunchy/fullstak-docker](https://github.com/Gastunchy/fullstack-docker.git))
2. Ingresar al directorio "fullstak-docker"
3. Ejecutar ````sudo chmod +x Deploy.sh" para hacer ejecutable el script````
4. ejecucion: ``./Deploy.sh``


