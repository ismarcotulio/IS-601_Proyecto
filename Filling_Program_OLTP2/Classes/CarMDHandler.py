# -*- coding: utf-8 -*-
"""
    @author  mruizq@unah.hn
    @version 0.1.0
    @date 2021/10/28
"""

from carmd import CarMD

class CarMDHandler:

    def __init__(self, authorization,  partnerToken):
        self.account = CarMD(authorization, partnerToken)

    def getCredits(self):
        return self.account.acct_credits()['data']['credits']

    