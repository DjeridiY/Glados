##
## EPITECH PROJECT, 2025
## gladdos
## File description:
## Makefile
##

all: lisp maryl

lisp:
	make -C lisp

maryl:
	make -C maryl

clean:
	make clean -C lisp
	make clean -C maryl

fclean:
	make fclean -C lisp
	make fclean -C maryl

re: fclean all

docs:
	make docs -C maryl

check:
	for p in maryl lisp; do (cd $$p && stack test --ghc-options=-Werror --allow-different-user) || exit 1; done
	cd maryl && cp "$$(stack path --local-install-root --allow-different-user)/bin/glados-exe" glados && \
	out="$$(bash test/compiler.sh 2>&1)"; echo "$$out" | grep -aE '✅|❌'; \
	[ "$$(echo "$$out" | grep -ac '✅')" -eq "$$(echo "$$out" | grep -ac 'Running ')" ]

.PHONY: all lisp maryl clean fclean re check
