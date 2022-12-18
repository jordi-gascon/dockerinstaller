#!/bin/bash

# Mostramos un menú para elegir entre las distintas distribuciones de Linux
echo "Selecciona la distribución de Linux sobre la que se instalará docker y docker compose"
echo "1. Ubuntu 22.04"
echo "2. Ubuntu 20.04"
echo "3. Debian Buster"
echo "4. Debian Bullseye"
read -p "Selecciona una opción (1, 2, 3 o 4): " distro

# Verificamos la opción seleccionada y realizamos las acciones necesarias para cada distro
if [ "$distro" == "1" ]; then
  distro_name="Ubuntu 22.04"
  # Añadimos los repositorios de Docker para Ubuntu 22.04
  apt-get update
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    focal \
    stable"
elif [ "$distro" == "2" ]; then
  distro_name="Ubuntu 20.04"
  # Añadimos los repositorios de Docker para Ubuntu 20.04
  apt-get update
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    focal \
    stable"
elif [ "$distro" == "3" ]; then
  distro_name="Debian Buster"
  # Añadimos los repositorios de Docker para Debian Buster
  apt-get update
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    buster \
    stable"
elif [ "$distro" == "4" ]; then
  distro_name="Debian Bullseye"
  # Añadimos los repositorios de Docker para Debian Bullseye
  apt-get update
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2
    software-properties-common
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  add-apt-repository
    "deb [arch=amd64] https://download.docker.com/linux/debian
    bullseye
    stable"
else
echo "Opción inválida. Saliendo del script."
exit 1
fi

Instalamos Docker y Docker Compose
apt update
apt install -y docker.io docker-compose

Iniciamos el servicio de Docker y habilitamos el inicio automático
systemctl start docker
systemctl enable docker

Verificamos que Docker y Docker Compose estén instalados correctamente
if ! command -v docker > /dev/null; then
echo "Docker no se ha instalado correctamente. Saliendo del script."
exit 1
fi

if ! command -v docker-compose > /dev/null; then
echo "Docker Compose no se ha instalado correctamente. Saliendo del script."
exit 1
fi

echo "Docker y Docker Compose se han instalado correctamente en $distro_name."