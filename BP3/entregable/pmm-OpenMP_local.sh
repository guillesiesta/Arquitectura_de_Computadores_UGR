#!/./bash

echo "secuencial"
./pmm 100
./pmm 500
./pmm 1000
./pmm 1500

echo "paralelo 4 threads"
export OMP_NUM_THREADS=4

./pmmO 100
./pmmO 500
./pmmO 1000
./pmmO 1500

echo "paralelo 8 threads"
export OMP_NUM_THREADS=8

./pmmO 100
./pmmO 500
./pmmO 1000
./pmmO 1500
