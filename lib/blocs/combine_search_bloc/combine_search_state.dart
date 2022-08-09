part of 'combine_search_bloc.dart';

abstract class CombineSearchState extends Equatable {
  const CombineSearchState();

  @override
  List<Object> get props => [];
}

class CombineSearchBlocInitial extends CombineSearchState {}

class SearchVisibilityState extends CombineSearchState {
  bool visibility;
  SearchVisibilityState({this.visibility});

  @override
  List<Object> get props => [visibility];
}
