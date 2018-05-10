#include <stdio.h>
#include <omp.h>
void main() {

	int n = 9, i, a, b[n];
	for (i=0; i<n; i++) b[i] = -1;

	#pragma omp parallel 
	{
		#pragma omp single
		{ 
			printf("Introduce valor de inicialización a: ");
			scanf("%d", &a );
			printf("Single Inicial ejecutada por el thread %d\n", omp_get_thread_num());
		}

		#pragma omp for
		for (i=0; i<n; i++)
			b[i] = a;
			//printf("Iteración Inicial ejecutada por el thread %d\n", omp_get_thread_num());
		
		//#pragma omp barrier
		//hay barrera implícita después del for

		#pragma omp single
		{ 
			printf("Imprimo dentro de la región parallel con la directiva single:\n");
			printf("Single Final ejecutada por el thread %d\n", omp_get_thread_num());
			for (i=0; i<n; i++){
				//printf("Iteración Final ejecutada por el thread %d\n", omp_get_thread_num()); 
				printf("b[%d] = %d\n",i,b[i]);
			}
				
		}

	
	}

	
}
