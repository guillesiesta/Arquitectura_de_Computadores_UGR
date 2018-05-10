#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
    unsigned i, j, k;

    if(argc < 2)
    {
        fprintf(stderr, "falta size\n");
        exit(-1);
    }


    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    int **ma, **mb, **mc;
    ma = (int **) malloc(N*sizeof(int*));
    mb = (int **) malloc(N*sizeof(int*));
    mc = (int **) malloc(N*sizeof(int*));

	//reserva de memoria
    for (i=0; i<N; i++){
        ma[i] = (int *) malloc(N*sizeof(int));
        mb[i] = (int *) malloc(N*sizeof(int));
        mc[i] = (int *) malloc(N*sizeof(int));
    }

    // Inicialización
    for (i=0; i<N; i++){
        for (j=0; j<N; j++){
            ma[i][j] = 0; //aquí es donde almacenaremos el resultado
            mb[i][j] = 6;
            mc[i][j] = 4;
        }
    }

    struct timespec cgt1,cgt2; double ncgt;

    clock_gettime(CLOCK_REALTIME,&cgt1);
    // Multiplicación
    for (i=0; i<N; i++){
        for (j=0; j<N; j++){
            for (k=0; k<N; k++){
                ma[i][j] += mb[i][k] * mc[k][j];
			}
		}
	}
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Pitamos la primera y la ultima linea de la matriz resultante
    printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",ncgt,ma[0][0],ma[N-1][N-1]);

    // Liberamos la memoria
    for (i=0; i<N; i++)
    {
        free(ma[i]);
        free(mb[i]);
        free(mc[i]);
    }
    free(ma);
    free(mb);
    free(mc);

    return 0;
}
