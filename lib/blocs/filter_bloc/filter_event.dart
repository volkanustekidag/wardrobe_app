part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterVisibilityEvent extends FilterEvent {
  bool visibility;

  ChangeFilterVisibilityEvent({this.visibility});

  @override
  List<Object> get props => [visibility];
}
