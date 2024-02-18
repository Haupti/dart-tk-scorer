import 'dart:convert';
import 'dart:io';

import 'package:ftk/domain/player.dart';

File _playersFile = File("data/players.json");
Map<String, Player>? _cachePlayers;

void _savePlayers() {
  if (!_playersFile.existsSync()) {
    _playersFile.createSync(recursive: true);
  }

  if (_cachePlayers?.values != null || _cachePlayers!.values.isNotEmpty) {
    String jsonPlayers = jsonEncode(_cachePlayers!.values.map((e) => e.toJson()).toList());
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

void upsertPlayer(Player player) {
  _loadPlayers();
  _cachePlayers![player.id.toString()] = player;
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
