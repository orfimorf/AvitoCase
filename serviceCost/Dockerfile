# устанавливаем официальный образ Node.js
FROM node:18.18.2

# указываем рабочую (корневую) директорию
WORKDIR /backpurplehack

# копируем основные файлы приложения в рабочую директорию
COPY package.json package-lock.json ./

# устанавливаем указанные зависимости NPM на этапе установки образа
RUN npm install

RUN mkdir -p /root/.postgresql && \
    wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" \
    --output-document /root/.postgresql/root.crt && \
    chmod 0600 /root/.postgresql/root.crt

# после установки копируем все файлы проекта в корневую директорию
COPY . ./

# запускаем основной скрипт в момент запуска контейнера
CMD node index.js