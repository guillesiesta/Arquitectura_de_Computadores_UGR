// gcc -O2 algo.c -o nombre -fopenmp
#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

int main(int argc, char** argv)
{
	int i, j;
	double t1, t2, total;

	//Argumento de entrada, N es el número de componentes del vector
	if (argc<2){
		printf("Falta tamaño de la matriz y del vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]); 

	double *v1, *v2, **M;
	v1 = (double*) malloc(N*sizeof(double));
	v2 = (double*) malloc(N*sizeof(double)); 
	M = (double**) malloc(N*sizeof(double *));

	if ( (v1==NULL) || (v2==NULL) || (M==NULL) ){
		printf("Error en la reserva de espacio para los vectores\n");
		exit(-2);
	}

	for (i=0; i<N; i++){
		M[i] = (double*) malloc(N*sizeof(double));
		if ( M[i]==NULL ){
			printf("Error en la reserva de espacio para la matriz\n");
			exit(-2);
		}
	}

	//Inicializar matriz y vectores
	for (i=0; i<N;i++){
		v1[i] = i;
		v2[i] = 0;
		for(j=0;j<N;j++)
			M[i][j] = i+j;
	}

	//Tomamos tiempo antes de operar
	t1 = omp_get_wtime();

	#pragma omp parallel 
	{
		#pragma omp for
		//Calcular producto de matriz por vector M * v1 = v2
		for (i=0; i<N;i++){
			for(j=0;j<N;j++){
					v2[i] += M[i][j] * v1[j];
			}
		}
	}
	//Tomamos tiempo después de operar
	t2 = omp_get_wtime();
	total = t2 - t1;

	//Imprimir el resultado primero y último, además del tiempo de ejecución
	printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\t/ V2[0]=%8.6f V2[%d]=%8.6f\n", total,N,v2[0],N-1,v2[N-1]);

	// Imprimir todos los componentes de v2 para valores de entrada no muy altos
	if (N<20){
		for (i=0; i<N;i++){
			printf(" V2[%d]=%5.2f\n", i, v2[i]);
		}
	}

	free(v1); // libera el espacio reservado para v1
	free(v2); // libera el espacio reservado para v2
	for (i=0; i<N; i++)
		free(M[i]);
	free(M);

return 0;
}
