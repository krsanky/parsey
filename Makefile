CFLAGS+= -W -Wall -O2 -std=c99 -g -pedantic
#cc -O2 -pipe    -o main main.c

all: wiki admin menu sample options

options: $@.c $(SRCS) $(HDRS)
	$(CC) $(CFLAGS) -o $@ $@.c ${SRCS} $(LDFLAGS)

test: test_codemirror 
	@echo CURDIR:${.CURDIR}
	@echo TARGET:$@ [should be 'test']
	@echo CFLAGS: $(CFLAGS)
	@echo LDFLAGS: ${LDFLAGS}

indent:
	@echo "indenting all code..."
	./indent-all.sh

deploy: all
#	cp -f sample ../htdocs/sample.cgi
	cp -rf templates ../htdocs/

clean:
	rm -f main

.PHONY: test clean indent deploy all

