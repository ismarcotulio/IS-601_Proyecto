//import app from './app'
//import './database/connection'

//app.listen(app.get('port'))
//console.log('port is:',app.get('port'));

import {tableFuncionProceduresFill} from './controllers/human_r.tablesFuncionProcedures'
import {dataFill} from './controllers/human_r.initial_data'
import {newPosition, getPosition} from './controllers/human_r.position'
import {newCountry, getConuntry} from './controllers/human_r.country'
import {newDepartament, getDepartament} from './controllers/human_r.departament'
import {newCities, getCities} from './controllers/human_r.cities'
import {newSuburn, getSuburn} from './controllers/human_r.suburn'
import {newAdress, getAdress} from './controllers/human_r.address_list'
import {newArea, getArea} from './controllers/human_r.area'
import {newPerson,getPerson} from './controllers/human_r.person'
import {newContracts, getContracts} from './controllers/human_r.contrats'
import {newEmployee, getEmployee} from './controllers/human_r.employee'
import {newTelephones, getTelephones} from './controllers/human_r.telephones'
import {newT_person, getT_person} from './controllers/human_r.telephone_person'
import {newClient, getClient} from './controllers/human_r.client'
import {newCompany, getCompany} from './controllers/human_r.company'
import {newT_Company, getT_Company} from './controllers/human_r.telephone_company'
import {newClientPerson} from './controllers/human_r.client_person'
import {dataFinalFill} from './controllers/human_r.final_data'


function refresh(){
        tableFuncionProceduresFill('',()=>{
            dataFill('', ()=>{
                newPosition('', ()=>{
                    newCountry('', ()=>{
                        newDepartament('', ()=>{
                            newCities('', ()=>{
                                newSuburn('', ()=>{
                                    newAdress('', ()=>{
                                        newArea('', ()=>{
                                            newPerson('', ()=>{
                                                newContracts('', ()=>{
                                                    newEmployee('', ()=>{
                                                        newTelephones('', ()=>{
                                                            newT_person('', ()=>{
                                                                newClient('', ()=>{
                                                                    newCompany('', ()=>{
                                                                        newT_Company('', ()=>{
                                                                            newClientPerson('', ()=>{
                                                                                dataFinalFill('', ()=>{
                        
                                                                                })
                                                                            })
                                                                        })
                                                                    })
                                                                })
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
}

refresh()

