import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/search_service.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService searchService;
  
  SearchBloc(this.searchService) : super(InitialSearchState());
}