make re
gcc -L . -lasm main.c
./a.out
make fclean
rm a.out
rm -rf a.out.dSYM