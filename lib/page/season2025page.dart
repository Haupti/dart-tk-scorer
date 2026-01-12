import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ftk/domain/player.dart';
import 'package:ssr/html.dart';
import 'package:ftk/page/percent_utils.dart';

class Season2025Page implements Component {
  @override
  String render() {
    Map<String, Player> players = repo.getSeasonPlayers(2025);
    List<Player> sortedPlayers =
        players.values.where((it) => it.totalMatchesCount() > 5).toList();
    sortedPlayers.sort((p1, p2) => p1.points().compareTo(p2.points()));
    List<String> elems = [];
    for (final (index, player) in sortedPlayers.reversed.indexed) {
      elems.add("""
          <tr>
            <td>${index + 1}</td>
            <td>${player.points()}</td>
            <td>${player.name}</td>
            <td>${player.wins}</td>
            <td>${player.losses}</td>
            <td>${calcuatePercent(player.wins, player.losses)}</td>
            <td>${player.wins + player.losses}</td>
          </tr>
        """);
    }
    return """
    <div>
      <header>
        <h1> Season 2025 Final Ranking </h1>
        <p> End: 12.1.2025 </p>
      </header>
      <table class="table">
        <thead>
          <tr>
            <th>Rank</th>
            <th>Points</th>
            <th scope="col">Player</th>
            <th scope="col">Wins</th>
            <th scope="col">Losses</th>
            <th scope="col">Rate (%)</th>
            <th scope="col">Total</th>
          </tr>
        </thead>
        <tbody>
          ${elems.join("\n")}
        </tbody>
      </table>
    </div>
  """;
  }
}
