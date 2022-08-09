part of 'combine_search_bloc.dart';

abstract class CombineSearchBlocEvent extends Equatable {
  const CombineSearchBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangeSearchVisibilityEvent extends CombineSearchBlocEvent {
  bool visibility;
  ChangeSearchVisibilityEvent({this.visibility});

  @override
  List<Object> get props => [visibility];
}
