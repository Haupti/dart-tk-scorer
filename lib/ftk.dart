import 'package:ssr/ssr.dart' as ssr;
import 'package:ssr/html.dart' as ssr;
import 'components/root.dart';
import 'dart:io';



class HomePageContent implements ssr.Component{

  String tableStyle = ssr.Style(maxWidth:"1000px").inline();
  @override
  String render() {
    return """
    <center>
    <table style="$tableStyle">
      <thead>
        <tr>
          <th scope="col">Rank</th>
          <th scope="col">Points</th>
          <th scope="col">Player</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Cell</td>
          <td>Cell</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Cell</td>
          <td>Cell</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Cell</td>
          <td>Cell</td>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <th scope="col">Rank</th>
          <td scope="col">Points</td>
          <td scope="col">Player</td>
        </tr>
      </tfoot>
    </table>
    </center>
  """;
  }
}

void homeHandler (HttpRequest request, ssr.SsrResponse response) {
    ssr.okHtmlResponse(response, ftkRoot([HomePageContent()]));
}

void ftk() {
  List<ssr.RequestHandler> handlers =[
    ssr.RequestHandler(path: "/", method: ssr.RequestMethod.mGet, handler: homeHandler).setMinimumRole(ssr.AuthRole.admin),
  ];
  ssr.server(8080, handlers);
}
