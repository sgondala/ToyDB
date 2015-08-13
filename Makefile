#PUBLICDIR= /usr0/cs564/public/project
SRC= buf.c hash.c pf.c
OBJ= buf.o hash.o pf.o
HDR = pftypes.h pf.h 

pflayer.o: $(OBJ)
	ld -r -o pflayer.o $(OBJ)

tests: testhash testpf testssd testraid

testpf: testpf.o pflayer.o
	cc -o testpf testpf.o pflayer.o

testssd: testssd.o pflayer.o
	cc -o testssd testssd.o pflayer.o

testraid: testraid.o pflayer.o
	cc -o testraid testraid.o pflayer.o

testhash: testhash.o pflayer.o
	cc -o testhash testhash.o pflayer.o

$(OBJ): $(HDR)

testhash.o: $(HDR)

testpf.o: $(HDR)

testssd.o: $(HDR)

testraid.o: $(HDR)

lint: 
	lint $(SRC)

install: pflayer.o 

