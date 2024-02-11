import 'package:ftk/components/simple.dart';
import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/repository.dart' as repo;

class PlayerManagerContent implements ssr.Component{

  static ssr.Component playerDeleteSwap() {
    return SimpleComponent("");
  }

  static ssr.Component playerRow(Player player) {
    String id = player.id.hashCode.toString();
    String selectId = "${id}select";
    return SimpleComponent("""
              <tr id="$selectId">
                <td>
                  <button
                     hx-post="/api/player/delete"
                     hx-vals='{"playerid":"${player.id.toString()}"}'
                     hx-swap="outerHTML" hx-target="[id='$selectId']"
                     class="contrast"
                     style="width: 100px;"
                     role="button"
                     hx-confirm="Are you sure?">
                    delete
                  </button>
                </td>
                <td>${player.id}</td>
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
            <form>
            <tr id="player-add-row">
              <td><input type="submit" value="save" hx-post="/api/player/add" hx-swap="beforebegin" hx-include="[name='new-player-name']" hx-target="#player-add-row"/></td>
              <td></td>
              <td><input type="text" name="new-player-name" placeholder="new player name" pattern="[a-zA-Z0-9]+([ ]?[a-zA-Z0-9]+)?"></td>
            </tr>
            </form>
          </tbody>
      </table>
    """;
  }
}
