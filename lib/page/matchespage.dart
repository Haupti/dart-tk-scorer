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
            <th style="text-align: right;">Winner</th>
            <th>  </th>
            <th>Second Place</th>
          </tr>
        </thead>
        <tbody>
            ${matches.map((m) => """
              <tr>
                <td style="text-align: right;">${players[m.t1Player1.toString()]?.name ?? "(removed)"} & ${players[m.t1Player2.toString()]?.name ?? "(removed)"}</td>
                <td style="text-align: center;">VS</td>
                <td>${players[m.t2Player1.toString()]?.name ?? "(removed)"} & ${players[m.t2Player2.toString()]?.name ?? "(removed)"}</td>
              </tr>
            """).join("\n")}
        </tbody>
      </table>
    """;
  }
}
