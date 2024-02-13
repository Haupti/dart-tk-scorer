import 'package:ftk/dataprovider/repository.dart' as repo;
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:ssr/html.dart';

class MatchesOverview implements Component {

  @override
  String render(){
    List<TkMatch> matches = repo.getMatches();
    Map<String, Player> players = repo.getPlayers();
    return """
      <h1>Matches</h1>
      <table class="table">
        <thead>
          <tr>
            <th>Winner</th>
            <th>  </th>
            <th>Second Place</th>
          </tr>
        </thead>
        <tbody>
            ${matches.map((m) => """
              <tr>
                <td>${players[m.t1Player1.toString()]?.name} & ${players[m.t1Player2.toString()]?.name}</td>
                <td>VS</td>
                <td>${players[m.t2Player1.toString()]?.name} & ${players[m.t2Player2.toString()]?.name}</td>
              </tr>
            """).join("\n")}
        </tbody>
      </table>
    """;
  }
}