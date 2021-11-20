import {Router} from 'express'
import {newPerson,getPerson} from '../controllers/human_r.person'
import {newContracts, getContracts} from '../controllers/human_r.contrats'
import {newEmployee, getEmployee} from '../controllers/human_r.employee'
import {newCompany, getCompany} from '../controllers/human_r.company'
import {dataFill} from '../controllers/human_r.initial_data'
import {tableFuncionProceduresFill} from '../controllers/human_r.tablesFuncionProcedures'
import {newCountry, getConuntry} from '../controllers/human_r.country'
import {newDepartament, getDepartament} from '../controllers/human_r.departament'
import {newCities, getCities} from '../controllers/human_r.cities'
import {newPosition, getPosition} from '../controllers/human_r.position'
import {newSuburn, getSuburn} from '../controllers/human_r.suburn'
import {newArea, getArea} from '../controllers/human_r.area'
import {newAdress, getAdress} from '../controllers/human_r.address_list'
import {newTelephones, getTelephones} from '../controllers/human_r.telephones'
import {newT_person, getT_person} from '../controllers/human_r.telephone_person'
import {newT_Company, getT_Company} from '../controllers/human_r.telephone_company'
import {newClient, getClient} from '../controllers/human_r.client'

const router= Router()

router.get('/HUMAN_R.CLIENT',getClient)
router.post('/HUMAN_R.CLIENT',newClient)
router.get('/HUMAN_R.TELEPHONES_COMPANY',getT_Company)
router.post('/HUMAN_R.TELEPHONES_COMPANY',newT_Company)
router.get('/HUMAN_R.TELEPHONES_PERSON',getT_person)
router.post('/HUMAN_R.TELEPHONES_PERSON',newT_person)
router.get('/HUMAN_R.TELEPHONES_PERSON',getT_person)
router.post('/HUMAN_R.TELEPHONES_PERSON',newT_person)
router.get('/HUMAN_R.TELEPHONES',getTelephones)
router.post('/HUMAN_R.TELEPHONES',newTelephones)
router.get('/HUMAN_R.ADDRESS_LIST',getAdress)
router.post('/HUMAN_R.ADDRESS_LIST',newAdress)
router.get('/HUMAN_R.AREA',getArea)
router.post('/HUMAN_R.AREA',newArea)
router.get('/HUMAN_R.SUBURN',getSuburn)
router.post('/HUMAN_R.SUBURN',newSuburn)
router.get('/HUMAN_R.POSITION',getPosition)
router.post('/HUMAN_R.POSITION',newPosition)
router.post('/HUMAN_R.tablesFuncionProcedures',tableFuncionProceduresFill)
router.post('/HUMAN_R.INITIAL_DATA',dataFill)
router.get('/HUMAN_R.PERSON',getPerson)
router.post('/HUMAN_R.PERSON',newPerson)
router.get('/HUMAN_R.CONTRACTS',getContracts)
router.post('/HUMAN_R.CONTRACTS',newContracts)
router.get('/HUMAN_R.EMPLOYEES',getEmployee)
router.post('/HUMAN_R.EMPLOYEES',newEmployee)
router.get('/HUMAN_R.COMPANY',getCompany)
router.post('/HUMAN_R.COMPANY',newCompany)
router.get('/HUMAN_R.COUNTRY',getConuntry)
router.post('/HUMAN_R.COUNTRY',newCountry)
router.get('/HUMAN_R.DEPARTAMENT',getDepartament)
router.post('/HUMAN_R.DEPARTAMENT',newDepartament)
router.get('/HUMAN_R.CITIES',getCities)
router.post('/HUMAN_R.CITIES',newCities)

export default router