// gcc -O2 algo.c -o nombre -fopenmp
#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

#define MAX 1000 // el valor maxio que podemos ponerle

int main(int argc, char** argv)
{
	int i, j;
	double t1, t2, total;

	//Argumento de entrada, N es el número de componentes del vector
	if (argc<2){
		printf("Falta tamaño de la matriz y el vector\n");
		exit(-1);
	}

	unsigned int N = atoi(argv[1]); 


	if (N>MAX){
		 N=MAX;
	}

	double v1[MAX], v2[MAX], M[MAX][MAX];

	//Inicializamos matriz y vectores
	for (i=0; i<N;i++)
	{
		v1[i] = i;
		v2[i] = 0;
		for(j=0;j<N;j++)
			M[i][j] = i+j;
	}

	//Tomamos tiempo antes de operar
	t1 = omp_get_wtime();

	//Calcular producto de matriz por vector M * v1 = v2
	for (i=0; i<N;i++)
		for(j=0;j<N;j++)
			v2[i] += M[i][j] * v1[j];

	//Tomamos tiempo después de operar
	t2 = omp_get_wtime();
	total = t2 - t1;

	//Imprimir el resultado y el tiempo de ejecución
	printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\t/ V2[0]=%8.6f V2[%d]=%8.6f\n", total,N,v2[0],N-1,v2[N-1]);

	// Imprimir todos los componentes de v2 para valores de entrada no muy altos
	if (N<20){
		for (i=0; i<N;i++){
			printf(" V2[%d]=%5.2f\n", i, v2[i]);
		}
	}

	return 0;
}
