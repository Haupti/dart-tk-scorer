import 'package:ssr/html.dart' as ssr;
class GameAddContent implements ssr.Component {

  @override
  String render() {
    return """
<form>

  <div class="grid">

    <label for="team1player1">
      Team 1 Player 1
      <input type="text" id="team1player1" name="team1player1" placeholder="Team 1 Player 1" required list="t1p1list">
    </label>
  </div>
  <button type="submit">Submit</button>

  <datalist id="t1p1list">
    <option value="aa">
    <option value="bb">
    <option value="cc">
  </datalist>
</form>
    """;
  }
}