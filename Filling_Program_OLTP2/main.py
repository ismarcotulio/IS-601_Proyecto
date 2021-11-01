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

def main():    
    
    mongo = MongoDB()
    carMD = CarMDHandler()
    dataExtractor = DataExtractor()
    dataHandler = DataHandler(mongo, carMD, dataExtractor)
    
    limit = 1
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
            dataExtractor.getJsonFromTable(tables[3])
        )
        mongo.insertToCollection(vehicleData)
        count = count + 1
        dataHandler.updateLastVerifiedPost(postDataList[3])

    print("Se han insertado {} vehiculos en la base de datos de MongoDB exitosamente.".format(count))
    
     



if __name__ == "__main__":
    main()