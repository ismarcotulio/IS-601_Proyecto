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
    vehicles = mongo.getCollection("vehicles")

    

    carMD = CarMDHandler("Basic YTMxOTM1YzYtMzNkNC00Y2IzLWE1ZGUtZjJlYzlhMTUyOThh","a20d667e373e484d93ee848d79e8688b")
    print(carMD.getCredits())
    


if __name__ == "__main__":
    main()