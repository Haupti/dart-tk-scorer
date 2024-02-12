import 'package:ftk/dataprovider/repository.dart';
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/player.dart';
import 'package:ftk/page/addmatch/add_match_dto.dart';
import 'package:ftk/page/addmatch/add_match_page.dart';
import 'package:ssr/ssr.dart' as ssr;

ssr.RequestHandler addMatchApi() {
  return ssr.RequestHandler(
      path: "/api/match/add",
      method: ssr.RequestMethod.mPost,
      handler: (ssr.SsrRequest request, ssr.SsrResponse response) {
        AddMatchFormDataDto? dto = request.requestData == null ? null :  AddMatchFormDataDto.fromFormData(request.requestData!);
        if(dto != null && dto.t1p1Id != null && dto.t1p2Id != null && dto.t2p1Id != null && dto.t2p2Id != null && dto.winner != null && (dto.winner == "team1" || dto.winner == "team2")){
          Winner winner = dto.winner == "team1" ? Winner.teamOne : Winner.teamTwo;
          TkMatch match = TkMatch(t1Player1: Id(dto.t1p1Id!), t1Player2: Id(dto.t1p2Id!), t2Player1: Id(dto.t2p1Id!), t2Player2: Id(dto.t2p2Id!), winner: winner);
          upsertMatch(match);
          ssr.okPartialHtmlResponse(response, MatchAddContent.successToast());
        } else {
          ssr.okPartialHtmlResponse(response, MatchAddContent.valueMissingToast());
        }
      });
}