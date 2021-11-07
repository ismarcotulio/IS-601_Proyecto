import express from 'express'
import config from './config'
import personRoute from './routes/person.routes'

const app = express()

//settings 
let port;
app.set('port',config.port)

//middlewares
app.use(express.json)
app.use(express.urlencoded({ extended: false}));
app.use(personRoute)

export default app