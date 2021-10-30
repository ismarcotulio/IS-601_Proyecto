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
    
    limit = 3
    count = 0   

    
    while count < limit:
        postDataList = dataHandler.getLastValidPost()
        tables = postDataList[2]

        vehicleData = dataHandler.buildVehicleData(
            postDataList[0],
            postDataList[1],
            dataHandler.getLastValidAccount(),
            dataExtractor.getJsonFromTable(tables[3])
        )

        mongo.insertToCollection(vehicleData)

        count = count + 1



if __name__ == "__main__":
    main()