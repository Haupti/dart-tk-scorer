import 'package:ftk/domain/player.dart';
import 'package:ftk/page/playermanager.dart';
import 'package:ssr/ssr.dart' as ssr;
import 'package:ftk/dataprovider/repository.dart' as repo;

ssr.RequestHandler _managerDeletePlayerApi() {
  return ssr.RequestHandler(
      path: "/api/player/delete",
      method: ssr.RequestMethod.mPost,
      handler: (ssr.SsrRequest request, ssr.SsrResponse response) {
        String? value = extractId(request.requestData);
        if (value == null) {
          ssr.clientErrorResponse(response);
          return;
        } else {
          Id playerId = Id(value);
          repo.removePlayer(playerId);
          ssr.okPartialHtmlResponse(response, PlayerManagerContent.playerDeleteSwap());
        }
      }).setMinimumRole(ssr.AuthRole.admin);
}

ssr.RequestHandler _managerPlayerAddApi() {
  return ssr.RequestHandler(
      path: "/api/player/add",
      method: ssr.RequestMethod.mPost,
      handler: (ssr.SsrRequest request, ssr.SsrResponse response) {
        String? value = extractName(request.requestData?.replaceAll(RegExp(r'%20'), " "));
        List<Player> players = repo.getPlayers().values.toList();
        if (value == null || players.any((p) => p.name == value)) {
          ssr.clientErrorResponse(response);
          return;
        } else {
          Player player = Player.createNewUnknownPlayer(value);
          repo.upsertPlayer(player);
          ssr.okPartialHtmlResponse(response, PlayerManagerContent.playerRow(player));
        }
      }).setMinimumRole(ssr.AuthRole.admin);
}

String? extractName(String? data) {
  RegExp regex = RegExp(r'(?<==)[a-zA-Z0-9]+([ ]?[a-zA-Z0-9]+)?$');
  RegExpMatch? match = regex.firstMatch(data ?? "");
  return match?[0];
}

String? extractId(String? data) {
  RegExp regex = RegExp(r'(?<==).*');
  RegExpMatch? match = regex.firstMatch(data ?? "");
  return match?[0];
}

List<ssr.RequestHandler> managerApi = [_managerDeletePlayerApi(), _managerPlayerAddApi()];
