import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/player_repo.dart' as repo;

class HomePageContent implements ssr.Component {
  @override
  String render() {
    Map<String, Player> players = repo.getPlayers();
    List<Player> sortedPlayers = players.values.toList();
    sortedPlayers.sort((p1, p2) => p1.points().compareTo(p2.points()));
    List<String> elems = [];
    for (final (index, player) in sortedPlayers.reversed.indexed) {
      elems.add("""
          <tr>
            <td>${index + 1}</td>
            <td>${player.points()}</td>
            <td>${player.name}</td>
            <td>${player.wins}/${player.losses}</td>
          </tr>
        """);
    }

    return """
    <div>
      <table class="table">
        <thead>
          <tr>
            <th>Rank</th>
            <th>Points</th>
            <th scope="col">Player</th>
            <th scope="col">W/L</th>
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
