`docker --version` permite ver la version de docker

`docker images` permite ver las imagenes

`docker run` permite crear un contenedor

Ejemplo de creacion de contenedor basico:

---
```docker run --name mysqlv1 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest```


`docker ps` permite visualizar los conenedores que estan en ejecucion 

`docker ps-a` permite visualizar los conenedores que estan en ejecucion o no

`docker stop id o nombre del contenedor` detiene un contenedor

`docker start id o nombre del contenedor` inicializa un contenedor

`docker rm id o nombre del contenedor` elimina un contenedor

`docker rm id o nombre del contenedor` eminina un contenedor - pero se bede detener primero

`docker rm -f id o nombre de el contenedor` forza la eliminacion del contenedor sin reiniciarlo