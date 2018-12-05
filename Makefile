UNAME := $(shell uname)
CC=gcc

ifeq ($(UNAME),Linux)
   CLFLAGS = -lOpenCL
endif
ifeq ($(UNAME),Darwin)
   CLFLAGS = -framework opencl
endif

SRC_GPU=gpu.c
SRC_CPU=cpu.c
OUT_GPU=gpu
OUT_CPU=cpu

all: clean gpu cpu

gpu:
	$(CC) $(SRC_GPU) -o $(OUT_GPU) $(CLFLAGS)

cpu:
	$(CC) $(SRC_CPU) -o $(OUT_CPU)

clean:
	rm -f $(OUT_GPU) $(OUT_CPU)

