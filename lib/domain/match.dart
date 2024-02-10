import 'player.dart';
import 'dart:io';
enum Winner {
  teamOne(key:"team1"),
  teamTwo(key:"team2");

  final String key;
  const Winner({required this.key});
  static Winner fromKey(String key){
    switch(key) {
      case "team1": return teamOne;
      case "team2": return teamTwo;
      default: print("ERROR: cannot create Winner from this key: $key"); exit(1);
    }
  }
}

class Match {
  Id t1Player1;
  Id t1Player2;
  Id t2Player1;
  Id t2Player2;
  Winner winner;

  Match({
    required this.t1Player1,
    required this.t1Player2,
    required this.t2Player1,
    required this.t2Player2,
    required this.winner,
  });

  Map<String, String> toJson(){
      return {
        "t1p1": t1Player1.toString(),
        "t1p2": t1Player1.toString(),
        "t2p1": t1Player1.toString(),
        "t2p2": t1Player1.toString(),
        "winner": winner.key,
      };
  }

  static Match fromJson(Map<String, dynamic> jsonMap){
    return Match(
      t1Player1: Id(jsonMap["t1p1"] as String),
      t1Player2: Id(jsonMap["t1p2"] as String),
      t2Player1: Id(jsonMap["t2p1"] as String),
      t2Player2: Id(jsonMap["t2p2"] as String),
      winner: Winner.fromKey(jsonMap["winner"] as String),
      );
  }
}