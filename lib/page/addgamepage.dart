import 'package:ssr/html.dart' as ssr;

class GameAddContent implements ssr.Component {
  @override
  String render() {
    return """
    <div class="container">
    <h1> add a match </h1>
    <form>
      <h2> Team 1 </h2>
        <div class="grid">
          <button> choose player 1 </button>
          <input disabled type="text"/>
        </div>
        <div class="grid">
          <button> choose player 2 </button>
          <input disabled type="text"/>
        </div>
        <h2> Team 2 </h2>
        <div class="grid">
          <button> choose player 1 </button>
          <input disabled type="text"/>
        </div>
        <div class="grid">
          <button> choose player 1 </button>
          <input disabled type="text"/>
        </div>
        <h2> Winner </h2>
        <div class="grid">
          <div>
            <input type="radio" id="t1WinnerId" name="winner" value="team1"/>
            <label for="t1WinnerId"> Team 1 </label>
          </div>
          <div>
            <input type="radio" id="t2WinnerId" name="winner" value="team2"/>
            <label for="t2WinnerId"> Team 2 </label>
          </div>
        </div>
    </form>
    <div>
    """;
  }
}
