import 'package:equatable/equatable.dart';

import '../../models/moment.dart';

abstract class MomentState extends Equatable {
  const MomentState();

  @override
  List<Object?> get props => [];
}

class LoadingMomentState extends MomentState {
  final String postId;

  const LoadingMomentState(this.postId);

  @override
  List<Object?> get props => [postId];
}

class LoadedMomentState extends MomentState {
  final Moment moment;

  const LoadedMomentState(this.moment);

  @override
  List<Object?> get props => [moment];
}

class ErrorMomentState extends MomentState {
  final String error;

  const ErrorMomentState(this.error);

  @override
  List<Object?> get props => [error];
}

// Likes
class LikedMomentState extends MomentState {}
class UnlikedMomentState extends MomentState {}
