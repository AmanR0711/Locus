import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchUsersEvent extends SearchEvent {
  final String username;

  const SearchUsersEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class SearchLocationsEvent extends SearchEvent {
  final String locationName;

  const SearchLocationsEvent(this.locationName);

  @override
  List<Object?> get props => [locationName];
}