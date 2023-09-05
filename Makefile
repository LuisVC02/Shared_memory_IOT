
CC ?= gcc

APP_NAME_PIPE_SND   = memory_send
OBJ_FILES_PIPE_SND  = memory_send.o

APP_NAME_PIPE_RCV  = memory_rcv
OBJ_FILES_PIPE_RCV = memory_rcv.o

LIBS = .


all: $(APP_NAME_PIPE_SND) $(APP_NAME_PIPE_RCV)

$(APP_NAME_PIPE_SND): $(OBJ_FILES_PIPE_SND)
	$(CC) -o $@ $^


$(APP_NAME_PIPE_RCV): $(OBJ_FILES_PIPE_RCV)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) -o $@ -c $^ -g


clean:
	rm *.o $(APP_NAME_PIPE_SND) $(APP_NAME_PIPE_RCV)

fresh:
	make clean
	make all
