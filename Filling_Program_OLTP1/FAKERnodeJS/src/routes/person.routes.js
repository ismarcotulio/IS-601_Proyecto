import {Router} from 'express'
import {newPerson,getPerson} from '../controllers/person.controller'

const router= Router()

router.get('/HUMAN_R.PERSON',getPerson)
router.post('/HUMAN_R.PERSON',newPerson)

export default router