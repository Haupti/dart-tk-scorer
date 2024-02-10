import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/repository.dart' as repo;

class PlayerManagerContent implements ssr.Component{

  String tableStyle = ssr.Style(maxWidth:"1000px").inline();
  @override
  String render() {
    List<Player> players = repo.getPlayers().values.toList();
    return """
      <table>
        <thead>
          <tr>
            <td> </td>
            <td> ID </td>
            <td> name </td>
          <tr>
        </thead>
        <tbody>
            ${players.map((e) => """
              <tr id="${e.id}-row">
                <td>
                  <button hx-post="/api/player/delete" hx-swap="delete" hx-target="#${e.id}-row" class="contrast" style="width: 100px;" role="button">
                    delete
                  </button>
                </td>
                <td id="${e.id}-id">${e.id}</td>
                <td>${e.name}</td>
              </tr>
              """).toList().join("\n")}
          </tbody>
      </table>
    """;
  }
}
