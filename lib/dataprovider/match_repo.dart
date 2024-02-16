import 'dart:convert';
import '../domain/match.dart';
import 'dart:io';

File _matchesFile = File("data/matches.json");

List<TkMatch>? _cacheMatches;

void _saveMatches() {
  if (!_matchesFile.existsSync()) {
    _matchesFile.createSync(recursive: true);
  }

  String jsonMatches = jsonEncode(_cacheMatches ?? []);
  _matchesFile.writeAsStringSync(jsonMatches);
}

void _loadMatches() {
  if (_cacheMatches != null) {
    return;
  }
  _cacheMatches ??= [];

  if (!_matchesFile.existsSync()) {
    return;
  }
  String content = _matchesFile.readAsStringSync();
  if (content == "") {
    return;
  }

  List<dynamic> matchesJson = jsonDecode(content);
  for (var matchJson in matchesJson) {
    TkMatch match = TkMatch.fromJson(matchJson);
    _cacheMatches?.add(match);
  }
}

void upsertMatch(TkMatch match) {
  _loadMatches();
  _cacheMatches?.add(match);
  _saveMatches();
}

List<TkMatch> getMatches() {
  _loadMatches();
  return List.of(_cacheMatches ?? {});
}
