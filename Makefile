TARGET = wsprd

## Fortran-free build: OSD (osdwspr.f90 / indexx.f90) is replaced by the
## osd_stub.o no-op, so this builds with gcc alone (no gfortran).
OBJECTS = \
  wsprd.o wsprd_utils.o wsprsim_utils.o tab.o fano.o jelinek.o nhash.o \
  osd_stub.o pffft.o

CC = gcc
LD = gcc
RM = rm -f

## Portable flags: builds on x86 dev boxes and ARM Pis (32- or 64-bit).
## For extra speed on a 32-bit ARMv7 Pi you may add:
##   -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard
CFLAGS = -Wall -O3 -funroll-loops -ffast-math

all: $(TARGET)

%.o: %.c
	${CC} -c ${CFLAGS} $< -o $@

$(TARGET): $(OBJECTS)
	$(LD) $(OBJECTS) -o $@ -lm

clean:
	$(RM) *.o $(TARGET)
