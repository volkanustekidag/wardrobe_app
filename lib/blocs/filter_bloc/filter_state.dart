part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class FilterVisibilityState extends FilterState {
  bool visible;

  FilterVisibilityState({this.visible});

  @override
  List<Object> get props => [visible];
}
