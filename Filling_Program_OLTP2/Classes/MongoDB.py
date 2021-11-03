# -*- coding: utf-8 -*-
"""
    @author  mruizq@unah.hn
    @version 0.1.0
    @date 2021/10/28
"""

from pymongo import MongoClient

class MongoDB:

    def __init__(self):
        self.CONNECTION_STRING = "mongodb+srv://grupounois601:grupounois601@cluster0.jwzk2.mongodb.net/CarDealership_OLTP2?retryWrites=true&w=majority"
        self.mydb = self.getDB()
        print("Se realizo la conexion correctamente")
    
    
    def getDB(self):
        client = MongoClient(self.CONNECTION_STRING)
        return client['CarDealership_OLTP2']

    def getCollection(self, name):
        return self.mydb[name]

    def verifyCarInDB(self, text):
        if(self.mydb.vehicles.find(
            {'vin': text}
        ).count()>0):
            return True
        else:
            return False

    def insertToCollection(self, dict, name):
        collection = self.getCollection(name)
        x = collection.insert_one(dict)

    def getLastItemFromCollection(self, collectionName):
        collection = self.getCollection(collectionName)
        last = collection.find().limit(1).sort([('$natural',-1)])
        return last
