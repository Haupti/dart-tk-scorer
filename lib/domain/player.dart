import 'package:nanoid/nanoid.dart';

class Id {
  final String _id;

  Id(String id) : _id = id;

  @override
  String toString() {
    return _id;
  }
}

class Player {
  String name;
  int _points;
  int wins;
  int losses;
  Id id;

  Player(
      {required this.name,
      required int points,
      required this.wins,
      required this.losses,
      required this.id})
      : _points = points;

  static Player createNewUnknownPlayer(String name) {
    return Player(
        name: name, points: 800, wins: 0, losses: 0, id: Id(nanoid()));
  }

  void addPoints(int price) {
    _points += price;
  }

  int totalMatchesCount() {
      return wins + losses;
  }

  void subractPoints(int penalty) {
    if (_points - penalty < 0) {
      _points = 0;
    } else {
      _points -= penalty;
    }
  }

  int points() {
    return _points;
  }

  Map<String, String> toJson() {
    return {
      "name": name,
      "points": _points.toString(),
      "wins": wins.toString(),
      "losses": losses.toString(),
      "id": id.toString(),
    };
  }

  static Player fromJson(Map<String, dynamic> json) {
    return Player(
      id: Id(json["id"] as String),
      name: json["name"] as String,
      wins: int.parse(json["wins"] as String),
      losses: int.parse(json["losses"] as String),
      points: int.parse(json["points"] as String),
    );
  }
}
