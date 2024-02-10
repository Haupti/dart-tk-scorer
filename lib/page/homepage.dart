import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/repository.dart' as repo;

class HomePageContent implements ssr.Component{

  String tableStyle = ssr.Style(maxWidth:"1000px").inline();
  @override
  String render() {
    Map<String, Player> players = repo.getPlayers();
    players.values.toList().sort((p1, p2) => p1.points.compareTo(p2.points));
    List<String> elems = [];
    for(final (index, player) in players.values.indexed) {
        elems.add("""
          <tr>
            <th scope="row"> ${index+1} </th>
            <td>${player.points}</td>
            <td>${player.name}</td>
          </tr>
        """);
    }

    return """
    <center>
    <table style="$tableStyle">
      <thead>
        <tr>
          <th scope="col">Rank</th>
          <th scope="col">Points</th>
          <th scope="col">Player</th>
        </tr>
      </thead>
      <tbody>
        ${elems.join("\n")}
      </tbody>
      <tfoot>
        <tr>
          <th scope="col">Rank</th>
          <td scope="col">Points</td>
          <td scope="col">Player</td>
        </tr>
      </tfoot>
    </table>
    </center>
  """;
  }
}
