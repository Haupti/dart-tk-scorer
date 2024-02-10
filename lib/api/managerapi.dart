import 'package:ftk/domain/player.dart';
import 'package:ftk/page/playermanager.dart';
import 'package:ssr/ssr.dart' as ssr;
import 'package:ssr/html.dart' as ssr;

ssr.RequestHandler _managerDeletePlayerApi() {
  return ssr.RequestHandler(path: "/api/player/delete", method: ssr.RequestMethod.mPost, handler: (ssr.SsrRequest request, ssr.SsrResponse response) { 
    ssr.okPartialHtmlResponse(response, ssr.PartialHtml([PlayerManagerContent.playerDeleteSwap()]));
  }).setMinimumRole(ssr.AuthRole.admin);
}

ssr.RequestHandler _managerPlayerAddApi() {
  return ssr.RequestHandler(path: "/api/player/add", method: ssr.RequestMethod.mPost, handler: (ssr.SsrRequest request, ssr.SsrResponse response) { 
    ssr.okPartialHtmlResponse(response, ssr.PartialHtml([PlayerManagerContent.playerRow(Player(name: request.requestData ?? "", points: 1, id: Id("h123")))]));
  }).setMinimumRole(ssr.AuthRole.admin);
}


List<ssr.RequestHandler> managerApi = [
  _managerDeletePlayerApi(),
  _managerPlayerAddApi()
];
