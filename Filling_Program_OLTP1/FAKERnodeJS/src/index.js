import app from './app'
//import './database/connection'

app.listen(app.get('port'))
console.log('port is:',app.get('port'));