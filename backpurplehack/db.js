const { Sequelize } = require('sequelize');
const fs = require('fs');
const path = require('path');

// Чтение SSL-сертификата
const sslCertPath = path.resolve('/root/.postgresql/root.crt');
const sslOptions = fs.existsSync(sslCertPath) ? {
    ca: fs.readFileSync(sslCertPath).toString(),
    rejectUnauthorized: true,  // Проверяем, что сертификат действителен
} : {};

// Инициализация Sequelize
module.exports = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        dialect: 'postgres',
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialectOptions: {
            ssl: sslOptions,
        },
    }
);
