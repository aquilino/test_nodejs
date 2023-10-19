# Usa una imagen base de Node.js
FROM node:14

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json para instalar dependencias
COPY app/package.json ./

# Instala las dependencias de la aplicación
RUN npm install

# Copia el código de la aplicación al contenedor
COPY app/ ./

# Puerto en el que se ejecutará la aplicación
EXPOSE 8080

# Comando para iniciar la aplicación
CMD [ "node", "index.js" ]
