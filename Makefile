LATEXMK = latexmk
LATEXMK_ARGS = -f -use-make
VIEWER = firefox
RM = rm -f
SRC = src/

.PHONY: cv.pdf all clean

all: cv.pdf clean

cv.pdf:
	$(LATEXMK) $(LATEXMK_ARGS) cv.tex

clean:
	$(RM) -R aux/
	$(RM) build/*.aux
	$(RM) build/*.fdb_latexmk
	$(RM) build/*.fls
	$(RM) build/*.out
	$(RM) *.aux
	$(RM) *.fdb_latexmk
	$(RM) *.fls
	$(RM) *.out

cleanall: clean
	$(RM) build/*
	$(RM) *.pdf
	$(RM) *.log

view:
	$(VIEWER) build/cv.pdf
