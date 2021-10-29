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
    
    def getVehicleInfo(self, vin):
        api = "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/{}?format=json".format(vin)
        response = requests.get(api)
        return response.json()['Results'][0]
    
    def VerifyVIN(self, vin):
        vehicleInfo = self.getVehicleInfo(vin)
        if vehicleInfo['ErrorCode'] == '0':
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

    def buildVehicleData(self, post, account):
        vehicleInfo = self.getVehicleInfo(post['vin'])
        vehicleDict = {}
        vehicleDict.setdefault("due_date","")
        vehicleDict.setdefault("posting_date",post['posting_date'])
        vehicleDict.setdefault("vin",vehicleInfo["VIN"])
        vehicleDict.setdefault("manufacter",vehicleInfo["Manufacturer"])
        vehicleDict.setdefault("brand",vehicleInfo["Make"])
        vehicleDict.setdefault("model",vehicleInfo["Model"])
        vehicleDict.setdefault("series",vehicleInfo["Series"])
        vehicleDict.setdefault("year",vehicleInfo["ModelYear"])
        vehicleDict.setdefault("fuel_type",vehicleInfo["FuelTypePrimary"])
        vehicleDict.setdefault("vehicle_type",vehicleInfo["VehicleType"])
        vehicleDict.setdefault("body_class",vehicleInfo["BodyClass"])
        vehicleDict.setdefault("base_price",vehicleInfo["BasePrice"])
        vehicleDict.setdefault("engine",vehicleInfo["EngineModel"])
        vehicleDict.setdefault("brake_system",vehicleInfo["BrakeSystemType"])
        vehicleDict.setdefault("number_cylinders",vehicleInfo["EngineCylinders"])
        vehicleDict.setdefault("displacement_cc",vehicleInfo["DisplacementCC"])
        vehicleDict.setdefault("doors",vehicleInfo["Doors"])

        my_vehicle = account.vin(post['vin'])
        vehicleDict.setdefault("maintenances",my_vehicle.maintenance(50000)['data'])
        return vehicleDict
        