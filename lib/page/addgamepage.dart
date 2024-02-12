import 'package:ssr/html.dart' as ssr;

class GameAddContent implements ssr.Component {
  @override
  String render() {
    return """
    <div class="container">
    <h1> Add a Match </h1>
    <form id="addMatchForm">
      <h2> Team 1 </h2>
        <div class="container">
        <div class="columns">
        <div class="column">
          <label for="t1p1Select"> Choose Player 1 </label>
          <select id="t1p1Select" form="addMatchForm" class="form-select">
            <option> Player 1 </option>
            <option> Player 2 </option>
            <option> Player 3 </option>
            <option> Player 4 </option>
            <option> Player 5 </option>
          </select>
        </div>
        <div class="column">
          <label for="t1p2Select"> Choose Player 2 </label>
          <select id="t1p2Select" form="addMatchForm" class="form-select">
            <option> Player 1 </option>
            <option> Player 2 </option>
            <option> Player 3 </option>
            <option> Player 4 </option>
            <option> Player 5 </option>
          </select>
        </div>
        </div>
        </div>
        <h2 style="margin: 16px 0;"> Team 2 </h2>
        <div class="container">
        <div class="columns">
        <div class="column">
          <label for="t2p1Select"> Choose Player 1 </label>
          <select id="t2p1Select" form="addMatchForm" class="form-select">
            <option> Player 1 </option>
            <option> Player 2 </option>
            <option> Player 3 </option>
            <option> Player 4 </option>
            <option> Player 5 </option>
          </select>
        </div>
        <div class="column">
          <label for="t2p2Select"> Choose Player 2 </label>
          <select id="t2p2Select" form="addMatchForm" class="form-select">
            <option> Player 1 </option>
            <option> Player 2 </option>
            <option> Player 3 </option>
            <option> Player 4 </option>
            <option> Player 5 </option>
          </select>
        </div>
        </div>
        </div>
        <h2 style="margin: 16px 0;"> Winner </h2>
        <div class="container">
          <div class="columns">
          <div class="column col-auto">
            <input type="radio" id="t1WinnerId" name="winner" value="team1"/>
            <label for="t1WinnerId"> Team 1 </label>
          </div>
          <div class="column">
            <input type="radio" id="t2WinnerId" name="winner" value="team2"/>
            <label for="t2WinnerId"> Team 2 </label>
          </div>
          </div>
        </div>
        <input style="margin: 16px 0;" type="submit" class="btn btn-primary input-group-btn">
    </form>
    <div>
    """;
  }
}
