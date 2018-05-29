#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
    unsigned i, j, k;
	int total = 0;
	int h;
	int s1,s2,s3,s4,s5,s6,s7,s8;
	s1=s2=s3=s4=s5=s6=s7=s8=0;


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

	int iterations = N/8;

    // Multiplicación
    for (i=0; i<N; i++)
        for (j=0; j<N; j++)
        {
            s1=s2=s3=s4=s5=s6=s7=s8=0;
            for (h=0, k=0;h < iterations; ++h, k+=8)
            {
                    s1 += (mb[i][k]  *mc[k][j]  );
                    s2 += (mb[i][k+1]*mc[j][k+1]);
                    s3 += (mb[i][k+2]*mc[j][k+2]);
                    s4 += (mb[i][k+3]*mc[j][k+3]);
                    s5 += (mb[i][k+4]*mc[j][k+4]);
                    s6 += (mb[i][k+5]*mc[j][k+5]);
                    s7 += (mb[i][k+6]*mc[j][k+6]);
                    s8 += (mb[i][k+7]*mc[j][k+7]);
            }

            total = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8;
            ma[i][j]=total;

            for(k=iterations*8; k<N; ++k)
                total += (mb[i][k]*mc[j][k]);

            ma[i][j]=total;
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
