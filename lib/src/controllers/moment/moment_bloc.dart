import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/moment_service.dart';
import 'moment_event.dart';
import 'moment_state.dart';

class MomentBloc extends Bloc<MomentEvent, MomentState> {
  final MomentService momentService;
  final String postId;

  MomentBloc(
    this.momentService,
    this.postId,
  ) : super(LoadingMomentState(postId)) {
    on(
      (event, emit) async {
        if (event is LoadMomentEvent) {
          try {
            emit(LoadingMomentState(event.postId));
            final moment = await momentService.loadMoment(event.postId);
            emit(LoadedMomentState(moment));
          } catch (e) {
            emit(ErrorMomentState(e.toString()));
          }
        } else if (event is ToggleLikeMomentEvent) {
          try {
            final like = await momentService.toggleLike(
              event.postId,
              event.username,
            );
            emit(like ? LikedMomentState() : UnlikedMomentState());
          } catch (e) {
            emit(ErrorMomentState(e.toString()));
          }
        }
      },
    );
  }
}
