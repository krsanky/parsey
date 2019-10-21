CFLAGS+= -W -Wall -O2 -std=c99 -g -pedantic
#cc -O2 -pipe    -o main main.c

all: main 

options: $@.c $(SRCS) $(HDRS)
	$(CC) $(CFLAGS) -o $@ $@.c ${SRCS} $(LDFLAGS)

test:
	@echo CURDIR:${.CURDIR}
	@echo TARGET:$@ [should be 'test']
	@echo CFLAGS: $(CFLAGS)
	@echo LDFLAGS: ${LDFLAGS}

indent:
	./indent-all

deploy: all
#	cp -f sample ../htdocs/sample.cgi
	cp -rf templates ../htdocs/

clean:
	rm -f main *.BAK

.PHONY: test clean indent deploy all

