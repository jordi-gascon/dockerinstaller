##Script de instalación de Docker y Docker Compose
Este script le permite elegir entre varias distribuciones de Linux y luego instalar Docker y Docker Compose en la distribución seleccionada. Actualmente, las distribuciones compatibles son:

Ubuntu 22.04
Ubuntu 20.04
Debian Buster
Debian Bullseye
Instalación
Para utilizar este script, siga los siguientes pasos:

Descargue el script y guárdelo en un archivo con extensión ".sh".
Otorgue permisos de ejecución al archivo con el comando chmod +x nombre_del_archivo.sh.
Ejecute el script con ./nombre_del_archivo.sh.
Seleccione la distribución de Linux que desea instalar.
Siga las instrucciones en pantalla para completar la instalación de Docker y Docker Compose.
Verificación
Una vez que se haya completado la instalación, puede verificar que Docker y Docker Compose estén instalados correctamente ejecutando los siguientes comandos:

Copy code
docker --version
docker-compose --version
Si ambos comandos se ejecutan correctamente y muestran la versión instalada de Docker y Docker Compose, significa que la instalación se ha realizado correctamente.

#Uso
Para utilizar Docker y Docker Compose en su distribución de Linux, consulte la documentación oficial de Docker en https://docs.docker.com/. Allí encontrará información detallada sobre cómo usar estas herramientas y cómo trabajar con contenedores y aplicaciones empaquetadas en contenedores.

#Autor
Este script fue creado por @jordi-gascon

Licencia
Este script se distribuye bajo la licencia MIT. Puede encontrar una copia de la licencia en el archivo LICENSE adjunto al script.