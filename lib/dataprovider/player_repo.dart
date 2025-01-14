import 'dart:convert';
import 'dart:io';

import 'package:ftk/dataprovider/datapath_provider.dart';
import 'package:ftk/domain/player.dart';

File _playersFile = File("${appdataPath()}/data/players.json");
File _seasonPlayersFile(int season) =>
    File("${appdataPath()}/data/season/$season/players.json");
Map<String, Player>? _cachePlayers;

void _savePlayers() {
  if (!_playersFile.existsSync()) {
    _playersFile.createSync(recursive: true);
  }

  if (_cachePlayers?.values != null || _cachePlayers!.values.isNotEmpty) {
    String jsonPlayers =
        jsonEncode(_cachePlayers!.values.map((e) => e.toJson()).toList());
    _playersFile.writeAsStringSync(jsonPlayers, flush: true);
  }
}

void _loadPlayers() {
  if (_cachePlayers != null) {
    return;
  }
  _cachePlayers ??= {};

  if (!_playersFile.existsSync()) {
    return;
  }
  String content = _playersFile.readAsStringSync();
  if (content == "") {
    return;
  }

  List<dynamic> playersJson = jsonDecode(content);
  for (var playerJson in playersJson) {
    Player player = Player.fromJson(playerJson);
    _cachePlayers![player.id.toString()] = player;
  }
}

Map<String, Player> _parsePlayers(String json) {
  String content = _playersFile.readAsStringSync();
  if (content == "") {
    return {};
  }

  List<dynamic> playersJson = jsonDecode(content);
  Map<String, Player> players = {};
  for (var playerJson in playersJson) {
    Player player = Player.fromJson(playerJson);
    players[player.id.toString()] = player;
  }
  return players;
}

void upsertPlayer(Player player) {
  _loadPlayers();
  _cachePlayers![player.id.toString()] = player;
  _savePlayers();
}

void upsertPlayers(List<Player> players) {
  _loadPlayers();
  for (final player in players) {
    _cachePlayers![player.id.toString()] = player;
  }
  _savePlayers();
}

void removePlayer(Id id) {
  _loadPlayers();
  _cachePlayers?.remove(id.toString());
  _savePlayers();
}

Map<String, Player> getPlayers() {
  _loadPlayers();
  return Map.from(_cachePlayers ?? {});
}

Map<String, Player> getSeasonPlayers(int season) {
  final File seasonPlayers = _seasonPlayersFile(season);
  if (!seasonPlayers.existsSync()) {
    return {};
  }
  final Map<String, Player> players =
      _parsePlayers(seasonPlayers.readAsStringSync());

  return players;
}
