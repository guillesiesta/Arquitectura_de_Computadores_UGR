#!/bin/bash

echo "pmv-OpenMP-a"
./pmv-OpenMP-a 100
./pmv-OpenMP-a 500
./pmv-OpenMP-a 1000
./pmv-OpenMP-a 5000
./pmv-OpenMP-a 10000
./pmv-OpenMP-a 20000


echo "pmv-OpenMP-b"
./pmv-OpenMP-b 100
./pmv-OpenMP-b 500
./pmv-OpenMP-b 1000
./pmv-OpenMP-b 5000
./pmv-OpenMP-b 10000
./pmv-OpenMP-b 20000


echo "pmv-OpenMP-reduction"
./pmv-red 100
./pmv-red 500
./pmv-red 1000
./pmv-red 5000
./pmv-red 10000
./pmv-red 20000
