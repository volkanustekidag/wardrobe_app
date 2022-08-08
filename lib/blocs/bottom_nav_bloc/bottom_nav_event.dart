part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexNavBarEvent extends BottomNavEvent {
  int newIndex;
  ChangeCurrentIndexNavBarEvent({this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
