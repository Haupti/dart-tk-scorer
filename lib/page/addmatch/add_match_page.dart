import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ssr/html.dart' as ssr;
import 'package:ftk/domain/player.dart';

class MatchAddContent implements ssr.Component {
  String _renderSelect(String valueName, String labelValue, List<Player> players) {
    return """
    <label for="t1p1Select"> $labelValue </label>
    <select id="t1p1Select" name="$valueName" form="addMatchForm" class="form-select">
      <option value="none">Choose Player</option>
      ${players.map((p) => """<option value="${p.id}"> ${p.name} </option>""").join("\n")}
    </select>
    """;
  }

  static ssr.Component errorToastMsg(String msg) {
    return ssr.Component.fromHtmlString("""
    <div class="toast toast-error" id="matchAddToastElem">
      Something went wrong. $msg
    </div>
    """);
  }

  static ssr.Component successToast() {
    return ssr.Component.fromHtmlString("""
    <div class="toast toast-success" id="matchAddToastElem">
      Match saved!
    </div>
    """);
  }

  String _renderWinnerSelection(String valueName) {
    return """
    <div style="display: flex; justify-content: flex-start; align-items: baseline; gap: 32px;">
      <h2 style="margin: 16px 0;">Winner:</h2>
      <div>
        <input type="radio" id="t1WinnerId" name="$valueName" value="team1"/>
        <label for="t1WinnerId">Team 1</label>
      </div>
      <div>
        <input type="radio" id="t2WinnerId" name="$valueName" value="team2"/>
        <label for="t2WinnerId">Team 2</label>
      </div>
    </div>
    """;
  }

  @override
  String render() {
    List<Player> players = repo.getPlayers().values.toList();
    return """
    <div class="container">
    <h1> Add a Match </h1>
    <form id="addMatchForm" hx-post="/api/match/add" hx-target="#matchAddToastElem" hx-swap="outerHTML" hx-on::after-request="this.reset()">
      <div id="matchAddToastElem"></div>
      <h2>Team 1</h2>
        <div class="container">
          <div class="columns">
            <div class="column">
              ${_renderSelect("t1p1Select", "Player 1", players)}
            </div>
            <div class="column">
              ${_renderSelect("t1p2Select", "Player 2", players)}
            </div>
          </div>
        </div>
        <h2 style="margin: 16px 0;">Team 2</h2>
        <div class="container">
          <div class="columns">
            <div class="column">
              ${_renderSelect("t2p1Select", "Player 1", players)}
            </div>
            <div class="column">
              ${_renderSelect("t2p2Select", "Player 2", players)}
            </div>
          </div>
        </div>
        ${_renderWinnerSelection("winner")}
        <input style="margin: 16px 0;" type="submit" class="btn btn-primary input-group-btn" value="Submit">
    </form>
    <div>
    """;
  }
}
