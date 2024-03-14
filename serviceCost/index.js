require('dotenv').config()
const express = require("express");
const PORT = process.env.PORT
const app = express()
const fileUpload = require('express-fileupload')
const router = require("./routers");
const sequelize = require('./db')
const errorHandler = require('./middlewares/ErrorHandlingMiddleware')

app.use(express.json())
app.use(fileUpload({}));
app.use('/api', router)
app.use(errorHandler)

const start = async () => {
    try {

        await sequelize.authenticate()
        app.listen(PORT, () => console.log(`Server started on port ${PORT}`))

    } catch (e) {
        console.log(e)
    }
}

start()