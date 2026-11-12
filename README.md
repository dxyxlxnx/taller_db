# taller_db
Project for the lenguage 3, using technologis:  PostgreSQL, React, ReactNative, Vite, NodeJS, and the posible use of TypeScript
<br><hr>

## Reglas del Proyecto:
1. Antes de hacer cualquier cambio o trbajar con la base de datos, se debera actualizar el repositorio local (el de vuestro pc)
2. Antes cada cambio hecho y subido en el repo se debe indicar en el commit el area donde hubo el cambio y una descripcion mas especifica (no muy grande)
3. Antes y despues de realizar el cambio en la base de datos, tannto del repo como en SupaBase se debe hacer notiicacion a la otra parte del equipo
4. El cumplimiento de las reglas asegurarano pisarnos la cola mutuamente, y **aplica sin excepciones**

<br><hr>
## Flujo de Trabajo:
El obejitivo principal de repositorio es uncionar como un control de versiones y cambios realizados en la base de datos que estara alojada en un servidor externo, permitiendo asi cada uno mantener una propia version en local de la misma y un registro de cambio mejor organizados.
1. Los cambios realizado en la base de datos alojada no se veran reflajado aca de manera automatica asi que cada cambio hecho se debera registrar en los archivos .sql en la carperta correspondiente y en el archivo correspondiente
2. Cada cambio y realizado en el archivo debera tener comentado antes del mismo la fecha, hora e integrante que lo hizo
3. Al momento de agregar un nuevo cambio al repo (siguiendo las normativas estipuladas) se debe actualizar de manera local y ahi si realizar el cambio ysubirlo para evitar problemas de sobreescritura 

<br><hr>
## Manejo de Docker para la Base de Datos:
**REQUISITO:** tener instalado y configurado docker en tu pc
1) ingresar a la carpeta donde esta el documento de configuracion
2) ejecutar docker compose up -d
3) verificacion del servicio activo usando el comando  docker ps 
4) conexion al gestor de base de datos de preferencia se realiza de manera manual registrando los datos de la base de datos

La configuracion esta hecha de modo que en caso de un apagon o reinicio repentino del equipo donde este el docker levantado este conservara siu estado actual al momento de volver a iniciar, manteniendose siempre encendido el contenedor al momento de iniciar el ordenador pero en caso de dtenerlo amnualmente el servicio mantendra este estado respetandose en un proximo inicio de sesion en el ordenador.

**COMANDOS ESENCIALES PARA EL FLUJO DE TRABAJO:**
1) para encender o levantar  el servicio: docker compose up -d
2) para pausar o detener temporalmente el servicio (sin borrar nada): docker compose stop
3) para apagar y eliminar el contenedor (sin la eliminacion de los datos guardados en el volumen): docker compose down
4) en caso de apagar y eliminar por completo el contenedor y su volumen: docker compose down -v