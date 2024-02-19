build-win:
	export APPDATADIR_FTK=~/projects/ftk
	dart compile exe ./bin/ftk.dart -o tk-scorer

build-prod:
	cp resources/* /home/devel/appdata/ftk/resources/
	# fish: set -Ux APPDATADIR_FTK ~/appdata/ftk/
	dart compile  exe ./bin/ftk.dart -o tk-scorer

build:
	export APPDATADIR_FTK=~/projects/ftk
	dart compile  exe ./bin/ftk.dart -o tk-scorer
