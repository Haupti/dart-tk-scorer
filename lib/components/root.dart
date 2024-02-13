import 'package:ssr/html.dart' as ssr;

String root(String title, String content) {
  return """
    <!DOCTYPE HTML>
    <html lang="en" data-theme="dark">
      <head>
        <META charset="UTF-8">
        <META name="viewport" content="width=device-width, initial-scale=1.0">
        <title> $title </title>
        <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
        <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
        <style>
        </style>
        </head>
      <body>
        ${Navbar().render()}
        <div class="p-centered" style="max-width:1000px; margin: 0 32px 32px 32px;">
          $content
        </div>
      <script src="https://unpkg.com/htmx.org@1.9.10" integrity="sha384-D1Kt99CQMDuVetoL1lrYwg5t+9QdHe7NLX/SoJYkXDFfX37iInKRy5xLSi8nO7UC" crossorigin="anonymous"></script>
      </body>
    </html>
  """;
}

ssr.RootPage ftkRoot(List<ssr.Component> components) {
  return ssr.RootPage(elems: components, title: "Tischkicker Ranking", customRoot: root);
}

class Navbar implements ssr.Component {
  String navStyle = ssr.Style(padding: "16px", margin: "0 0 8px 0").inline();
  @override
  String render() {
    return """
    <header class="navbar" style="$navStyle">
      <section class="navbar-section">
        <a class="btn btn-link" href="/"> home </a></li>
        <a class="btn btn-link" href="/match/add"> add match </a></li>
        <a class="btn btn-link" href="/player/manager"> manager </a></li>
      </section>
    </header>
    """;
  }
}
