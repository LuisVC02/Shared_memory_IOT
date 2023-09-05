#include <stdio.h>
#include <sys/shm.h>
#include <sys/ipc.h>
#include <unistd.h>

#define KEY 0xBE83

#define MAX_LEN 80

int main(int argc, char * argv[])
{
	char * buff;
	int  retval;
	int  shm_id = shmget(KEY, 0, 0);
	
	if(shm_id == -1)
	{
		exit(-1);
	}

	printf("Shared memory\n");
	buff = shmat(shm_id, 0, 0);
	printf("%s\n", buff);
	retval = shmdt(buff);
	if(retval == 0)
	{
		printf("Memory dettached\n");
	}
	return 0;
}
