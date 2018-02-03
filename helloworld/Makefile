app = main
OBJDIR = obj/

app: assemble link

assemble: main.asm
	nasm -f elf $< -o $(app).o
	mv $(app).o $(OBJDIR)

link:
	ld -m elf_i386 -s -o $(app) $(OBJDIR)$(app).o

clean:
	rm $(app).o $(app)
