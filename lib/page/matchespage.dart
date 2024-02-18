import 'package:ftk/dataprovider/match_repo.dart' as repo;
import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:ssr/html.dart';

class MatchesOverview implements Component {
  @override
  String render() {
    List<TkMatch> matches = repo.getMatches();
    Map<String, Player> players = repo.getPlayers();
    return """
      <h1>Matches</h1>
      <table class="table">
        <thead>
          <tr>
            <th></th>
            <th style="text-align: center;">Team 1</th>
            <th></th>
            <th style="text-align: center;">Team 2</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
            ${matches.map((m) => """
              <tr>
                <td>${m.winner == Winner.teamOne ? """<img alt="winner icon" width="32" height="32" src="/api/resources?filename=winner.png" style="vertical-align: middle;"/>""" : ""}</td>
                <td style="text-align: center;">${players[m.t1Player1.toString()]?.name ?? "(removed)"} & ${players[m.t1Player2.toString()]?.name ?? "(removed)"}</td>
                <td style="text-align: center;">VS</td>
                <td style="text-align: center;">${players[m.t2Player1.toString()]?.name ?? "(removed)"} & ${players[m.t2Player2.toString()]?.name ?? "(removed)"}</td>
                <td>${m.winner == Winner.teamTwo ? """<img alt="winner icon" width="32" height="32" src="/api/resources?filename=winner.png" style="vertical-align: middle;"/>""" : ""}</td>
              </tr>
            """).join("\n")}
        </tbody>
      </table>
    """;
  }
}
