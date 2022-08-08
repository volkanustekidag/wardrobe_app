part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState extends Equatable {}

class BottomNavInitial extends BottomNavState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangedPage extends BottomNavState {
  int newIndex;
  ChangedPage({this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
