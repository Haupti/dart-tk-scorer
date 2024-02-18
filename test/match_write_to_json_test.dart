import 'dart:convert';

import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:test/test.dart';

void main() {
  test("write to josn", () {
    List<TkMatch> matches = [TkMatch(t1Player1: Id("11"), t2Player1: Id("21"), t1Player2: Id("12"), t2Player2: Id("22"), winner: Winner.teamOne)];
    String json = jsonEncode(matches);
    expect(json, '[{"t1p1":"11","t1p2":"12","t2p1":"21","t2p2":"22","winner":"team1"}]');
  });
}