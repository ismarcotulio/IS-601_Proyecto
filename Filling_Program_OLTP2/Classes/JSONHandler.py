# -*- coding: utf-8 -*-
"""
    @author  mruizq@unah.hn
    @version 0.1.0
    @date 2021/10/28
"""

import json
import requests

class JSONHandler:

    def __init__(self, mongo, carMD):
        self.mongo = mongo
        self.carMD = carMD

    
    def loadVINs(self):
        f = open("Collections/craigslists_car_posts.json")
        return json.load(f)

    def loadAccounts(self):
        f = open("Collections/carmd_accounts.json")
        return json.load(f)
    
    def VerifyVIN(self, vin):
        api = "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/{}?format=json".format(vin)
        response = requests.get(api)
        j = response.json()
        if j['Results'][0]['ErrorCode'] == '0':
            return True
        else:
            return False

    def getLastValidPost(self):
        state = 1
        count = 0
        posts = self.loadVINs()['posts']
        post = None

        while state == 1:     
            if self.VerifyVIN(posts[count]['vin']) == True:
                if self.mongo.verifyCarInDB(posts[count]['vin']) == False:
                    post = posts[count]
                    state = 0
            count = count + 1

        return post 
                    

    def getLastValidAccount(self):
        state = 1
        count = 0
        accounts = self.loadAccounts()['accounts']
        account = None

        while state == 1:
            creditsAccount = int(self.carMD.getAccount(
                accounts[count]['Authorization'],
                accounts[count]['partner-token'],
            ).acct_credits()['data']['credits'])
            if creditsAccount >= 5: 
                account = self.carMD.account
                state = 0
            
            count = count + 1

        return account 