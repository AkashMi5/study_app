import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/screens/splash/bloc/splash_event.dart';
import 'package:study_app/screens/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoadingState()) {
    on((event, emit) async {
      try {
        if (event is SplashLoadingEvent) {
          emit(SplashLoadingState());
          try {
            // check if user is loggedIn
            add(SplashNavigateToOtherScreenEvent(isUserLoggedin: false));
          } catch (e) {
            emit(SplashErrorState(e.toString()));
          }
        } else if (event is SplashNavigateToOtherScreenEvent) {
          debugPrint('navigate');
          emit(SplashNavigateToOtherScreenState(isUserLoggedin: false));
        } else {
          emit(SplashErrorState('Something went wrong!'));
        }
      } catch (e) {
        emit(SplashErrorState(e.toString()));
      }
    });
  }
}
