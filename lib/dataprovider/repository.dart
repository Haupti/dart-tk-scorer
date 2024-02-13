import 'dart:convert';
import '../domain/player.dart';
import '../domain/match.dart';
import 'dart:io';

File _playersFile = File("data/players.json");
File _matchesFile = File("data/matches.json");

Map<String, Player>? _cachePlayers;
List<TkMatch>? _cacheMatches;


void _savePlayers(){
  if(!_playersFile.existsSync()){
    _playersFile.createSync(recursive: true);
  }

  if(_cachePlayers?.values != null || _cachePlayers!.values.isNotEmpty){
    String jsonPlayers = jsonEncode(_cachePlayers!.values.map((e) => e.toJson()).toList());
    _playersFile.writeAsStringSync(jsonPlayers);
  }
}

void _loadPlayers() {
  if(_cachePlayers != null){
    return;
  }
  _cachePlayers ??= {};

  if(!_playersFile.existsSync()){
    return;
  } 
  String content = _playersFile.readAsStringSync();
  if(content == ""){
    return;
  }

  List<dynamic> playersJson = jsonDecode(content);
  for(var playerJson in playersJson) {
    Player player = Player.fromJson(playerJson);
    _cachePlayers![player.id.toString()] = player;
  }
}

void upsertPlayer(Player player){
  _loadPlayers();
  _cachePlayers![player.id.toString()] = player;
  _savePlayers();
}

void removePlayer(Id id){
  _loadPlayers();
  _cachePlayers?.remove(id.toString());
  _savePlayers();
}

Map<String, Player> getPlayers(){
  _loadPlayers();
  return Map.from(_cachePlayers ?? {});
}

void _saveMatches(){
  if(!_matchesFile.existsSync()){
    _matchesFile.createSync(recursive: true);
  }

  String jsonMatches = jsonEncode(_cacheMatches ?? []);
  _matchesFile.writeAsStringSync(jsonMatches);
}

void _loadMatches() {
  if(_cacheMatches != null){
    return;
  }
  _cacheMatches ??= [];

  if(!_matchesFile.existsSync()){
    return;
  } 
  String content = _matchesFile.readAsStringSync();
  if(content == ""){
    return;
  }

  List<dynamic> matchesJson = jsonDecode(content);
  for(var matchJson in matchesJson) {
    TkMatch match = TkMatch.fromJson(matchJson);
    _cacheMatches?.add(match);
  }
}

void upsertMatch(TkMatch match){
  _loadMatches();
  _cacheMatches?.add(match);
  _saveMatches();
}

List<TkMatch> getMatches(){
  _loadMatches();
  return _cacheMatches!;
}