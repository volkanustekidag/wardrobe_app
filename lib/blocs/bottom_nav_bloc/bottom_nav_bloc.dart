import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<ChangeCurrentIndexNavBarEvent>((event, emit) {
      emit(ChangedPage(newIndex: event.newIndex));
    });
  }
}
