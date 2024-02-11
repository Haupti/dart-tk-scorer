import 'package:ssr/html.dart' as ssr;
import 'color.dart';

String root(String title, String content){
  return """
    <!DOCTYPE HTML>
    <html lang="en" data-theme="dark">
      <head>
        <META charset="UTF-8">
        <META name="viewport" content="width=device-width, initial-scale=1.0">
        <title> $title </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
        <style>
        </style>
        </head>
      <body>
        ${Navbar().render()}
        $content
      <script src="https://unpkg.com/htmx.org@1.9.10" integrity="sha384-D1Kt99CQMDuVetoL1lrYwg5t+9QdHe7NLX/SoJYkXDFfX37iInKRy5xLSi8nO7UC" crossorigin="anonymous"></script>
      </body>
    </html>
  """;
}

ssr.RootPage ftkRoot(List<ssr.Component> components) {
  return ssr.RootPage(elems: components, title: "Tischkicker Ranking", customRoot: root);
}

class Navbar implements ssr.Component {
  String navStyle = ssr.Style(padding: "10px", borderBottom: "1px solid ${Colors.black}").inline();
  @override
  String render() {
    return """
    <nav style="$navStyle">
      <ul>
        <li><a href="/"> home </a></li>
        <li><a href="/game/add"> add game </a></li>
        <li><a href="/player/manager"> manager </a></li>
      </ul>
    </nav>
    """;
  }
}