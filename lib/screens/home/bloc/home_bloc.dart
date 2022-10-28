import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/screens/home/bloc/home_event.dart';
import 'package:study_app/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on((event, emit) async {
      try {
        if (event is HomeLoadingEvent) {
          emit(HomeLoadingState());
        } else if (event is NewTestEvent) {
          emit(NewTestState(newTest: event.newTest));
        } else if (event is HomeToCreateTestEvent) {
          emit(HomeToCreateTestState());
        } else {
          emit(HomeErrorState('Something went wrong!'));
        }
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
