# -*- coding: utf-8 -*-
"""
    @author  mruizq@unah.hn
    @version 0.1.0
    @date 2021/10/28
"""

from Classes.MongoDB import MongoDB
from Classes.DataHandler import DataHandler
from Classes.CarMDHandler import CarMDHandler
from Classes.DataExtractor import DataExtractor
from datetime import datetime
from bson.json_util import dumps
import time
import re

class Core:

    def __init__(self):
        self.mongo = MongoDB()
        self.currentTime = datetime.utcnow()
        self.initTime = time.perf_counter()

    def run(self):
        if self.allowInsertion():
            self.insertVehiclesToMongo()
        else:
            print("Lo lamentamos, aun no pasan 24 Hrs desde su ultima insercion. Intentelo mas tarde o hasta el dia siguiente.")

    def allowInsertion(self):
        last = self.mongo.getLastItemFromCollection("meta_insertions")
        last = list(last)
        if len(last) > 0:
            last = datetime.strptime(last[0]['date'], '%Y-%m-%d %H:%M:%S.%f')
            passHours = int(((self.currentTime-last).total_seconds()/3600))
            if passHours < 24:
                return False
            else:
                return True
        else:
            return True
        
    
    def insertVehiclesToMongo(self):
        
        carMD = CarMDHandler()
        dataExtractor = DataExtractor()
        dataHandler = DataHandler(self.mongo, carMD, dataExtractor)
    
        limit = 20
        count = 0
        lastVerifiedPost = dataHandler.getLastVerifiedPost()
        postDataList = None      

    
        while count < limit:
            if postDataList != None:
                lastPostNumber = postDataList[3]
            else:
                lastPostNumber = lastVerifiedPost
            postDataList = dataHandler.getLastValidPost(lastPostNumber)
            tables = postDataList[2]

            vehicleData = dataHandler.buildVehicleData(
                postDataList[0],
                postDataList[1],
                dataHandler.getLastValidAccount(),
                dataExtractor.getJsonFromTable(tables[3]),
            )
            self.mongo.insertToCollection(vehicleData, "vehicles")
            count = count + 1
            dataHandler.updateLastVerifiedPost(postDataList[3])

        
        timeData = {}
        lastTime = time.perf_counter()
        timeData.setdefault("date", "{}".format(self.currentTime))
        timeData.setdefault("count", count)
        timeData.setdefault("time", "{}".format(lastTime - self.initTime))
        self.mongo.insertToCollection(timeData, "meta_insertions")
        print("Se han insertado {} vehiculos en la base de datos de MongoDB exitosamente.".format(count))

    
    
    