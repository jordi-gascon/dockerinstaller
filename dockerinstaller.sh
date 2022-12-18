#!/bin/bash

# Autodetectamos la distribución de Linux y la versión
distro_name=$(lsb_release -is)
distro_version=$(lsb_release -cs)

# Mostramos la distribución y la versión detectadas al usuario
echo "Se ha detectado que estás utilizando $distro_name $distro_version."
read -p "¿Es esta la distribución y versión correctas? (s/n) " confirm

# Si el usuario confirma que la distribución y versión son correctas, procedemos a instalar Docker y Docker Compose
if [ "$confirm" == "s" ]; then
  # Verificamos si la distribución es Ubuntu o Debian y añadimos los repositorios de Docker adecuados
  if [ "$distro_name" == "Ubuntu" ]; then
    # Añadimos los repositorios de Docker para Ubuntu
    apt-get update
    apt-get upgrade -y
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $distro_version \
      stable"
  elif [ "$distro_name" == "Debian" ]; then
    # Añadimos los repositorios de Docker para Debian
    apt-get update
    apt-get upgrade -y
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    add-apt-repository
"deb [arch=amd64] https://download.docker.com/linux/debian
$distro_version
stable"
else
echo "Distribución no soportada. Saliendo del script."
exit 1
fi

#Instalamos Docker y Docker Compose
apt update
apt upgrade -y
apt install -y docker.io docker-compose

#Iniciamos el servicio de Docker y habilitamos el inicio automático
systemctl start docker
systemctl enable docker

#Verificamos que Docker y Docker Compose estén instalados correctamente
if ! command -v docker > /dev/null; then
echo "Docker no se ha instalado correctamente. Saliendo del script."
exit 1
fi

if ! command -v docker-compose > /dev/null; then
echo "Docker Compose no se ha instalado correctamente. Saliendo del script."
exit 1
fi

echo "Docker y Docker Compose se han instalado correctamente en $distro_name $distro_version."
else
echo "Saliendo del script sin realizar ninguna acción."
exit 0
fi