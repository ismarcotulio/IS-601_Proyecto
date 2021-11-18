#!/bin/bash

    echo "---------------------------------------------------------------------------"
    echo "------------------------CREANDO BASE DE DATOS-------------------------------"
    echo "---------------------------------------------------------------------------"
    sleep 30s
    cd /opt/mssql-tools/bin && ./sqlcmd -S db -U SA -P "BD2_Grupo1" -Q "CREATE DATABASE CarDealership_OLTP1"
    echo "BASE DE DATOS CREADA"
    cd /home/resources/IS-601_Proyecto
    echo "Cambiando a rama de prueba"
    git checkout TestBranch
    git pull
    cd Filling_Program_OLTP1/FAKERnodeJS
    echo "preparando el programa en node"
    dir
    npm install
    echo "---------------------------------------------------------------------------"
    echo "--------------EJECUTANDO PROGRAMA DE LLENADO EN NODEJS----------------------"
    echo "---------------------------------------------------------------------------"
    npm run dev
    echo "---------------------------------------------------------------------------"
    echo "--------------EJECUTANDO PROGRAMA DE LLENADO EN LARAVEL--------------------"
    echo "---------------------------------------------------------------------------"
    cd /home/resources/IS-601_Proyecto/Filling_Program_OLTP1
    php artisan migrate --seed
    echo "Gracias por la espera, base de datos llenada correctamente."
