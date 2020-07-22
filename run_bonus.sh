make bonus
gcc -L . -lasm main_bonus.c
./a.out
make fclean
rm a.out
rm -rf a.out.dSYM