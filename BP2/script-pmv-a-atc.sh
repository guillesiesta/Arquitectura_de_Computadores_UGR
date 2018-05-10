#!/bin/bash
#Se asigna al trabajo el nombre pmv-OpenMPa
#PBS -N pmv-OpenMPa
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

echo "pmv-OpenMP-a"
./pmv-OpenMP-a 100
./pmv-OpenMP-a 500
./pmv-OpenMP-a 1000
./pmv-OpenMP-a 5000
./pmv-OpenMP-a 10000
./pmv-OpenMP-a 20000
