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
		printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
		}

		#pragma omp for
		for (i=0; i<n; i++)
			b[i] = a;
			//printf("For ejecutada por el thread %d\n", omp_get_thread_num());
	
		//#pragma omp barrier
		//hay barrera implicita después del for

		#pragma omp master
		{
			printf("MASTER->%d:\n",omp_get_thread_num());
			for (i=0; i<n; i++) printf("b[%d] = %d\n",i,b[i]);
			printf("\n");	
		}
	}

	
}
