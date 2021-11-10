import {Router} from 'express'
import {newPerson,getPerson} from '../controllers/human_r.person'
import {newContracts, getContracts} from '../controllers/human_r.contrats'
import {newEmployee, getEmployee} from '../controllers/human_r.employee'
import {newCompany, getCompany} from '../controllers/human_r.company'

const router= Router()

router.get('/HUMAN_R.PERSON',getPerson)
router.post('/HUMAN_R.PERSON',newPerson)
router.get('/HUMAN_R.CONTRACTS',getContracts)
router.post('/HUMAN_R.CONTRACTS',newContracts)
router.get('/HUMAN_R.EMPLOYEES',getEmployee)
router.post('/HUMAN_R.EMPLOYEES',newEmployee)
router.get('/HUMAN_R.COMPANY',getCompany)
router.post('/HUMAN_R.COMPANY',newCompany)

export default router