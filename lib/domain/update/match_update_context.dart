import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ftk/domain/failure.dart';
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';

class MatchUpdateContext {
  Winner matchWinner;
  Player t1p1;
  Player t1p2;
  Player t2p1;
  Player t2p2;
  MatchUpdateContext(
      this.matchWinner, this.t1p1, this.t1p2, this.t2p1, this.t2p2);

  List<Player> getPlayers() {
      return [t1p1, t1p2, t2p1, t2p2];
  }
}

(MatchUpdateContext?, Failure?) createMatchUpdateContext(TkMatch match) {
  Map<String, Player> players = repo.getPlayers();
  Player? t1p1 = players[match.t1Player1.toString()];
  Player? t1p2 = players[match.t1Player2.toString()];
  Player? t2p1 = players[match.t2Player1.toString()];
  Player? t2p2 = players[match.t2Player2.toString()];
  if (t1p2 == null || t1p1 == null || t2p2 == null || t2p1 == null) {
    return (null, Failure("A player you specified was not found"));
  }
  if (t1p1 == t1p2 ||
      t1p1 == t2p1 ||
      t1p1 == t2p2 ||
      t1p2 == t1p1 ||
      t1p2 == t2p1 ||
      t1p2 == t2p2 ||
      t2p1 == t1p1 ||
      t2p1 == t1p2 ||
      t2p1 == t2p2 ||
      t2p2 == t1p1 ||
      t2p2 == t1p2 ||
      t2p2 == t2p1) {
    return (null, Failure("You cannot use the same player twice!"));
  }
  return (MatchUpdateContext(match.winner, t1p1, t1p2, t2p1, t2p2), null);
}
