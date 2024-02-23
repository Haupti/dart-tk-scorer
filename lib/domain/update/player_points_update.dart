import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:ftk/domain/update/match_update_context.dart';

int calculateWinnerPrice(
    {required Player winnerP1,
    required Player winnerP2,
    required Player looserP1,
    required Player looserP2}) {
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

MatchUpdateContext updatePlayerScores(MatchUpdateContext matchUpdateContext) {
  Player t1p1 = matchUpdateContext.t1p1;
  Player t1p2 = matchUpdateContext.t1p2;
  Player t2p1 = matchUpdateContext.t2p1;
  Player t2p2 = matchUpdateContext.t2p2;

  if (matchUpdateContext.matchWinner == Winner.teamOne) {
    int winnerPrice = calculateWinnerPrice(
        winnerP1: t1p1, winnerP2: t1p2, looserP1: t2p1, looserP2: t2p2);
    t1p1.addPoints(winnerPrice.round());
    t1p1.wins += 1;
    t1p2.addPoints(winnerPrice.round());
    t1p2.wins += 1;
    t2p1.subractPoints(winnerPrice.round());
    t2p1.losses += 1;
    t2p2.subractPoints(winnerPrice.round());
    t2p2.losses += 1;
  } else {
    int winnerPrice = calculateWinnerPrice(
        winnerP1: t2p1, winnerP2: t2p2, looserP1: t1p1, looserP2: t1p2);
    t1p1.subractPoints(winnerPrice.round());
    t1p1.losses += 1;
    t1p2.subractPoints(winnerPrice.round());
    t1p2.losses += 1;
    t2p1.addPoints(winnerPrice.round());
    t2p1.wins += 1;
    t2p2.addPoints(winnerPrice.round());
    t2p2.wins += 1;
  }
  matchUpdateContext.t1p1 = t1p1;
  matchUpdateContext.t1p2 = t1p2;
  matchUpdateContext.t2p1 = t2p1;
  matchUpdateContext.t2p2 = t2p2;

  return matchUpdateContext;
}

