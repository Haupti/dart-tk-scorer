import 'package:ftk/components/simple.dart';
import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';
import 'package:ftk/dataprovider/player_repo.dart' as repo;

class PlayerManagerContent implements ssr.Component {
  static ssr.Component playerDeleteSwap() {
    return SimpleComponent("");
  }

  static ssr.Component playerRow(Player player) {
    String id = player.id.hashCode.toString();
    String selectId = "${id}select";
    return SimpleComponent("""
              <tr id="$selectId">
                <td>
                  <button class="btn btn-error btn-action"
                     hx-post="/api/player/delete"
                     hx-vals='{"playerid":"${player.id.toString()}"}'
                     hx-swap="outerHTML" hx-target="[id='$selectId']"
                     hx-confirm="Are you sure?">
                     <i class="icon icon-delete"></i>
                  </button>
                </td>
                <td style="max-width: 100px;text-overflow: ellipsis; overflow: hidden;">${player.id}</td>
                <td>${player.name}</td>
              </tr>
              """);
  }

  @override
  String render() {
    List<Player> players = repo.getPlayers().values.toList();
    return """
      <table class="table">
        <thead>
          <tr>
            <th> </th>
            <th> ID </th>
            <th> name </th>
          <tr>
        </thead>
        <tbody>
          ${ssr.renderMany(players.map((e) => playerRow(e)).toList())}
          <tr id="player-add-row">
            <td><button class="btn btn-primary input-group-btn" type="submit" value="save" hx-post="/api/player/add" hx-swap="beforebegin" hx-include="[name='new_player_name']" hx-target="#player-add-row">save</button></td>
            <td></td>
            <td><input type="text" name="new_player_name" placeholder="new player name" pattern="[a-zA-Z0-9]+([ ]?[a-zA-Z0-9]+)?"></td>
          </tr>
          </tbody>
      </table>
    """;
  }
}
