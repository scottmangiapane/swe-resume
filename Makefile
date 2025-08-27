default:
	pdflatex -output-directory=src ./src/resume.tex

clean:
	rm -f **/*.aux **/*.fdb_latexmk **/*.fls **/*.log **/*.out **/*.pdf **/*.synctex.gz
	rm -rf build
