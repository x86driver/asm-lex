TARGET = asm

all:$(TARGET)

asm:asm.l
	flex asm.l
#	yacc -d parse.y
#	gcc -g -DYYDEBUG=1 -o $@ y.tab.c lex.yy.c -ly -ll
	gcc -g -DYYDEBUG=1 -o $@ lex.yy.c -ll

clean:
	rm -rf $(TARGET) *.o lex.yy.c y.tab.*
