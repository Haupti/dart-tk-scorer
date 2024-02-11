import 'package:ftk/api/managerapi.dart';
import 'package:ssr/ssr.dart' as ssr;
import 'components/root.dart';
import 'package:ftk/page/homepage.dart';
import 'package:ftk/page/addgamepage.dart';
import 'package:ftk/page/playermanager.dart';

void homeHandler(ssr.SsrRequest request, ssr.SsrResponse response) {
  ssr.okHtmlResponse(response, ftkRoot([HomePageContent()]));
}

void playerManagerHandler(ssr.SsrRequest request, ssr.SsrResponse response) {
  ssr.okHtmlResponse(response, ftkRoot([PlayerManagerContent()]));
}

void gameAddHandler(ssr.SsrRequest request, ssr.SsrResponse response) {
  ssr.okHtmlResponse(response, ftkRoot([GameAddContent()]));
}

void ftk() {
  List<ssr.RequestHandler> handlers =[
    ssr.RequestHandler(path: "/", method: ssr.RequestMethod.mGet, handler: homeHandler).setMinimumRole(ssr.AuthRole.basic),
    ssr.RequestHandler(path: "/player/manager", method: ssr.RequestMethod.mGet, handler: playerManagerHandler).setMinimumRole(ssr.AuthRole.admin),
    ...managerApi,
    ssr.RequestHandler(path: "/game/add", method: ssr.RequestMethod.mGet, handler: gameAddHandler).setMinimumRole(ssr.AuthRole.basic),
    ];
  ssr.server(8080, handlers);
}
