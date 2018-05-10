#include <stdio.h>
#ifdef _OPENMP
	#include <omp.h>
#endif

void main(){

	int i, n=7;
	int a[n], suma;

	for(i=0;i<n;i++){
		a[i]=i;
	}

	suma=1;
	#pragma omp parallel private(suma)
	{
		suma=0;
		#pragma omp for
		for(i=0;i<n;i++){
			suma = suma + a[i];
			printf("\nthread %d suma a[%d] /\n ", omp_get_thread_num(), i);
		}

		printf("\n* thread %d suma= %d", omp_get_thread_num(), suma);
	}

	printf("\n");
}
