import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/player_repo.dart' as repo;

int calculateWinnerPrice({required Player winnerP1, required Player winnerP2, required Player looserP1, required Player looserP2}) {
  final double averageWT = (winnerP1.points() + winnerP2.points()) / 2;
  final double averageLT = (looserP1.points() + looserP2.points()) / 2;
  final double winnerdiff = averageWT - averageLT;

  if (winnerdiff <= 50 && winnerdiff >= -50) {
    return 10;
  } else if (winnerdiff > 50 && winnerdiff <= 100) {
    return 6;
  } else if (winnerdiff > 100 && winnerdiff <= 150) {
    return 3;
  } else if (winnerdiff > 150) {
    return 1;
  } else if (winnerdiff < -50 && winnerdiff >= -100) {
    return 11;
  } else if (winnerdiff < -100 && winnerdiff >= -150) {
    return 13;
  }
  return 16;
}

String? updatePlayerScores(TkMatch match) {
  Map<String, Player> players = repo.getPlayers();
  Player? t1p1 = players[match.t1Player1.toString()];
  Player? t1p2 = players[match.t1Player2.toString()];
  Player? t2p1 = players[match.t2Player1.toString()];
  Player? t2p2 = players[match.t2Player2.toString()];
  if (t1p2 == null || t1p1 == null || t2p2 == null || t2p1 == null) {
    return "A player you specified was not found";
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
    return "You cannot use the same player twice!";
  }

  if (match.winner == Winner.teamOne) {
    int winnerPrice = calculateWinnerPrice(winnerP1: t1p1, winnerP2: t1p2, looserP1: t2p1, looserP2: t2p2);
    t1p1.addPoints(winnerPrice.round());
    t1p2.addPoints(winnerPrice.round());
    t2p1.subractPoints(winnerPrice.round());
    t2p2.subractPoints(winnerPrice.round());
    repo.upsertPlayer(t1p1);
    repo.upsertPlayer(t1p2);
    repo.upsertPlayer(t2p1);
    repo.upsertPlayer(t2p2);
  } else {
    int winnerPrice = calculateWinnerPrice(winnerP1: t2p1, winnerP2: t2p2, looserP1: t1p1, looserP2: t1p2);
    t1p1.subractPoints(winnerPrice.round());
    t1p2.subractPoints(winnerPrice.round());
    t2p1.addPoints(winnerPrice.round());
    t2p2.addPoints(winnerPrice.round());
    repo.upsertPlayer(t1p1);
    repo.upsertPlayer(t1p2);
    repo.upsertPlayer(t2p1);
    repo.upsertPlayer(t2p2);
  }

  return null;
}
