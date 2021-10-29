# -*- coding: utf-8 -*-
"""
    @author  mruizq@unah.hn
    @version 0.1.0
    @date 2021/10/28
"""

from Classes.MongoDB import MongoDB
from Classes.JSONHandler import JSONHandler
from Classes.CarMDHandler import CarMDHandler

def main():    
    
    mongo = MongoDB()
    carMD = CarMDHandler()
    jsonHandler = JSONHandler(mongo, carMD)
    limit = 3
    count = 0


    while count < limit:
        vehicleData = jsonHandler.buildVehicleData(
            jsonHandler.getLastValidPost(),
            jsonHandler.getLastValidAccount()
        )

        mongo.insertToCollection(vehicleData)

        count = count + 1

    
    
   




if __name__ == "__main__":
    main()