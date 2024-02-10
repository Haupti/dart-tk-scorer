import 'package:ftk/components/simple.dart';
import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/repository.dart' as repo;

class PlayerManagerContent implements ssr.Component{

  static ssr.Component playerDeleteSwap() {
    return SimpleComponent("");
  }

  static ssr.Component playerRow(Player player) {
    return SimpleComponent("""
              <tr id="${player.id}-row">
                <td>
                  <button hx-post="/api/player/delete" hx-swap="outerHTML" hx-target="#${player.id}-row" class="contrast" style="width: 100px;" role="button">
                    delete
                  </button>
                </td>
                <td id="${player.id}-id">${player.id}</td>
                <td>${player.name}</td>
              </tr>
              """);
  }


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
            ${ssr.renderMany(players.map((e) => playerRow(e)).toList())}
            <tr id="player-add-row">
              <td><button hx-post="/api/player/add" hx-swap="beforebegin" hx-include="[name='new-player-name']" hx-target="#player-add-row"> save </button></td>
              <td></td>
              <td><input type="text" name="new-player-name" placeholder="new player name" pattern="[a-zA-Z ]{3,100}"></td>
            </tr>
          </tbody>
      </table>
    """;
  }
}
