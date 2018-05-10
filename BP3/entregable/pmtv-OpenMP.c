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
    int i, j, debug=0; //si ponemos debug a 1 es para ver la matriz y el vector pintados

    //Argumento de entrada
    if(argc < 2){
        fprintf(stderr, "Falta tamaño de filas/columnas [opctional debug]\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

	if(argc == 3){
		debug = atoi(argv[2]);
	}

    // Inicializamos la matriz triangular (superior)
    int *vector, *result, **matriz;
    vector = (int *) malloc(N*sizeof(int)); // malloc necesita el tamaño en bytes
    result = (int *) malloc(N*sizeof(int)); //si no hay espacio suficiente malloc devuelve NULL
    matriz = (int **) malloc(N*sizeof(int*));

    for (i=0; i<N; i++)
        matriz[i] = (int*) malloc(N*sizeof(int));

    for (i=0; i<N; i++){
        for (j=i; j<N; j++){
            matriz[i][j] = 6;
        	vector[i] = 4;
        	result[i]=0;
		}
    }

	if(debug==1){
		// Pintamos la matriz
		printf("Matriz:\n");
		for (i=0; i<N; i++){
		    for (j=0; j<N; j++){
		        if (j >= i){
		            printf("%d ", matriz[i][j]);
		        }else{
		            printf("0 ");
				}
		    }
		    printf("\n");
		}
		
		// Pintamos el vector
		printf("Vector:\n");
		for (i=0; i<N; i++){
		    printf("%d ", vector[i]);
		}
		printf("\n");
	}
    
	double t1, t2, t_total;
    t1 = omp_get_wtime();

    //A por los resultados!!
	//uso runtime para poder variarlo luego con la variable OMP_SCHEDULE
	

	#pragma omp parallel for private(j) schedule(runtime)
    for (i=0; i<N; i++){
        for (j=i; j<N; j++){
            result[i] += matriz[i][j] * vector[j];
		}
	}

    t2 = omp_get_wtime();
	t_total = t2 - t1;

	if(debug==1){
		// Pintamos los resultados
		printf("Resultado:\n");
		for (i=0; i<N; i++){
		    printf("%d ", result[i]);
		}
		printf("\n");
	}

	//Se imprime el primer y el último valor del vector resultado :-)
	printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",t_total,result[0],result[N-1]);

    // Liberamos la memoria
    for (i=0; i<N; i++)
        free(matriz[i]);
	free(matriz);
	free(vector);
	free(result);
    return 0;
}
