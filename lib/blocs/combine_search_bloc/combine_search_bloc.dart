import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'combine_search_event.dart';
part 'combine_search_state.dart';

class CombineSearchBloc
    extends Bloc<CombineSearchBlocEvent, CombineSearchState> {
  CombineSearchBloc() : super(CombineSearchBlocInitial()) {
    on<ChangeSearchVisibilityEvent>((event, emit) {
      emit(SearchVisibilityState(visibility: event.visibility));
    });
  }
}
