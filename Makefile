all:
	git add .
	git commit -m "Ajout $(shell date '+%Y-%m-%d %H:%M:%S')" 
	git push
