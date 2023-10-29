import 'package:equatable/equatable.dart';

import '../../models/location.dart';
import '../../models/locus_user.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class InitialSearchState extends SearchState {}

class LoadingSearchState extends SearchState {
  final String query;

  const LoadingSearchState(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadedSearchUsersState extends SearchState {
  final List<LocusUser> users;

  const LoadedSearchUsersState(this.users);

  @override
  List<Object?> get props => [List<LocusUser>.from(users)];
}

class LoadedSearchLocationsState extends SearchState {
  final List<Location> locations;

  const LoadedSearchLocationsState(this.locations);

  @override
  List<Object?> get props => [List<Location>.from(locations)];
}

class ErrorSearchState extends SearchState {
  final String error;

  const ErrorSearchState(this.error);

  @override
  List<Object?> get props => [error];
}