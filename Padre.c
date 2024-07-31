#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Uso: %s vlr-inip vlr-finp fnc arg1 [arg2] ... [argN]\n", argv[0]);
    } else {
            int vlr_inip = atoi(argv[1]);
            int vlr_finp = atoi(argv[2]);
            if (vlr_inip > vlr_finp) {
                printf("El valor final debe ser mayor que el valor inicial\n");
                while (1) {
                }
            }
            //} else {
                printf("Va a ejecutarse el padre PID: %d\n", getpid());
                for (int i = vlr_inip; i <= vlr_finp; i++) {
                    printf("Conteo en el padre: %d\n", i);
                }
                char *nombre_funcion = argv[3];
                pid_t child_pid = fork();
                if (child_pid == -1) {
                    perror("Fallo en fork");
                    return 1;
                } else if (child_pid == 0) {
                    sleep(1);
                    printf("Va a ejecutarse el hijo PID (%s): %d de padre PID %d\n", nombre_funcion, getpid(), getppid());
                    char **args = &argv[3];
                    args[argc] = NULL;
                    if (nombre_funcion == NULL){ 
                        printf("Falló la ejecución del proceso hijo\n");
                    } else {
                        char command[100]; 
                        snprintf(command, sizeof(command), "./%s.sh", nombre_funcion);
                        int status_child = execvp(command, args);
                        if (status_child == -1) {
                                printf("Falló la ejecución del proceso hijo\n");
                        }
                    } //exit(1);
                } else {

                }
            //}
    }

    while (1) {
        // Mantener siempre los procesos en ejecución (aunque fallen o falten argumentos)
    }

    return 0;
}
