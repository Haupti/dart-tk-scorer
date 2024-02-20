import 'package:ftk/dataprovider/match_repo.dart' as repo;
import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';

void addMatchUpdatePlayers(TkMatch match){
    repo.upsertMatch(match);
    List<Player> players = repo.getPlayers().values.toList();

    repo.upsertPlayer();
}
