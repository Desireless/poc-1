FROM ubuntu:20.04
# actualizacion del sistema e instalacion de node
RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash \
    && apt-get install nodejs -yq && apt-get clean \ && rm -rf /var/lib/apt/lists/*

# -p para crear la carpeta si no existe
RUN mkdir -p /usr/src/app
# Especificar la carpeta de trabajo creada
WORKDIR /usr/src/app
# * copia todos los archivos que empiecen con package
COPY package*.json ./
# instala modulos
RUN npm install
# . para copiar todo del directorio actual al workdir .
COPY . .
# Exponer el puerto 9000
EXPOSE 9000
# Ejecutar comando creado en package.json
CMD ["npm", "start"]