import 'package:nanoid/nanoid.dart';

class Id{
  final String _id;

  Id(String id):
    _id = id;

  @override
  String toString(){
    return _id;
  }
}

class Player {
  String name;
  int points;
  Id id;

  Player({required this.name, required this.points, required this.id});

  static Player createNewUnknownPlayer(String name){
    return Player(name: name, points: 0, id: Id(nanoid()));
  }

  Map<String, String> toJson(){
    return {
      "name": name,
      "points": points.toString(),
      "id": id.toString(),
    };
  }

  static Player fromJson(Map<String, dynamic> json){
    return Player(
      id: Id(json["id"] as String),
      name: json["name"] as String,
      points: int.parse(json["points"] as String),
    );
  }
}