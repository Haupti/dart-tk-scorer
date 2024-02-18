build-win:
	dart compile exe ./bin/ftk.dart -DAPPDATADIR_FTK=C:\Users\marwi\projects\ftk -o tk-scorer

build-prod:
	cp resources/* /home/devel/appdata/ftk/resources/
	# fish: set -Ux APPDATADIR_FTK ~/appdata/ftk/
	dart compile  exe ./bin/ftk.dart -o tk-scorer