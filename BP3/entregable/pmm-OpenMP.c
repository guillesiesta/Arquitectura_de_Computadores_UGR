#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
    #define omp_get_num_threads() 1
    #define omp_set_num_threads(int)
    #define omp_in_parallel() 0
    #define omp_set_dynamic(int)
#endif


int main(int argc, char **argv)
{
    int i, j, k;

    //Argumento de entrada
    if(argc < 2){
        fprintf(stderr, "Falta tamaño de filas/columnas\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    // Reserva de espacio de las matrices
    int **ma, **mb, **mc;
    ma = (int **) malloc(N*sizeof(int*)); // malloc necesita el tamaño en bytes
    mb = (int **) malloc(N*sizeof(int*)); //si no hay espacio suficiente malloc devuelve NULL
    mc = (int **) malloc(N*sizeof(int*));

    for (i=0; i<N; i++){
        ma[i] = (int*) malloc(N*sizeof(int));
        mb[i] = (int*) malloc(N*sizeof(int));
        mc[i] = (int*) malloc(N*sizeof(int));
	}
	
	//inicialización de las matrices
    for (i=0; i<N; i++){
        for (j=0; j<N; j++){
            ma[i][j] = 0; //aquí es donde se almacenará el resultado
        	mb[i][j] = 6;
        	mc[i][j] = 4;
		}
    }

	double t1, t2, t_total;
	t1 = omp_get_wtime();

    //MULTIPLICACION
	#pragma omp parallel for private(j,k)
    for (i=0; i<N; i++){
        for (j=0; j<N; j++){
			for(k=0;k<N; k++){
            	ma[i][j] += mb[i][k] * mc[k][j];
			}
		}
	}

	t2 = omp_get_wtime();
	t_total = t2 - t1;

    // Imprimir por pantalla el resultado de la primera y última linea de la matriz resultado (ma)
    printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",t_total,ma[0][0],ma[N-1][N-1]);

    // Liberar la memoria
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
