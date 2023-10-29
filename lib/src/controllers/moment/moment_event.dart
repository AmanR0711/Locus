import 'package:equatable/equatable.dart';

abstract class MomentEvent extends Equatable {
  const MomentEvent();

  @override
  List<Object?> get props => [];
}

class LoadMomentEvent extends MomentEvent {
  final String postId;

  const LoadMomentEvent(this.postId);

  @override
  List<Object?> get props => [postId];
}

// Likes

class ToggleLikeMomentEvent extends MomentEvent {
  final String postId;
  final String username;

  const ToggleLikeMomentEvent(this.postId, this.username);

  @override
  List<Object?> get props => [postId, username];
}