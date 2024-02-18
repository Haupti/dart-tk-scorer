build-win:
	dart compile exe ./bin/ftk.dart -Dappdatadir=C:\Users\marwi\projects\ftk -o tk-scorer

build-prod:
	cp resources/* /home/devel/appdata/ftk/resources/
	dart compile -Dappdatadir=/home/devel/appdata/ftk exe ./bin/fkt.dart -o tk-scorer

run-win: build-win
	./tk-scorer
