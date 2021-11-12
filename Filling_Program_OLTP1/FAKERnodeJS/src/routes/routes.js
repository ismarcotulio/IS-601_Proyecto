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

const router= Router()

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