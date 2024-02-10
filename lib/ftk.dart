import 'package:ssr/ssr.dart' as ssr;
import 'components/root.dart';
import 'dart:io';
import 'package:ftk/page/homepage.dart';
import 'package:ftk/page/playermanager.dart';

void homeHandler (HttpRequest request, ssr.SsrResponse response) {
    ssr.okHtmlResponse(response, ftkRoot([HomePageContent()]));
}

void playerManagerHandler (HttpRequest request, ssr.SsrResponse response) {
    ssr.okHtmlResponse(response, ftkRoot([PlayerManagerContent()]));
}
void ftk() {
  List<ssr.RequestHandler> handlers =[
    ssr.RequestHandler(path: "/", method: ssr.RequestMethod.mGet, handler: homeHandler).setMinimumRole(ssr.AuthRole.basic),
    ssr.RequestHandler(path: "/player/manager", method: ssr.RequestMethod.mGet, handler: playerManagerHandler).setMinimumRole(ssr.AuthRole.admin),
  ];
  ssr.server(8080, handlers);
}
