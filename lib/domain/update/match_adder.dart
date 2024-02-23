import 'package:ftk/dataprovider/match_repo.dart' as repo;
import 'package:ftk/dataprovider/player_repo.dart' as repo;
import 'package:ftk/domain/failure.dart';
import 'package:ftk/domain/match.dart';
import 'package:ftk/domain/update/match_update_context.dart';
import 'package:ftk/domain/update/player_points_update.dart';


Failure? matchAddAndUpdatePlayers(TkMatch match) {
  var (context, createFailure) = createMatchUpdateContext(match);
  if(createFailure != null) { return createFailure; }
  if(context == null) { return Failure("no update context created"); }

  MatchUpdateContext updatedStatsContext = updatePlayerScores(context);
  repo.upsertPlayers(updatedStatsContext.getPlayers());
  repo.upsertMatch(match);
  return null;
}
