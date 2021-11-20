import express from 'express'
import config from './config'
import Route from './routes/routes'

const app = express()

//settings 
let port;
app.set('port',config.port)

//middlewares
app.use(express.json())
app.use(express.urlencoded({ extended: false}));
app.use(Route)

export default app