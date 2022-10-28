import 'package:equatable/equatable.dart';
import 'package:study_app/models/study_test.dart';

abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  HomeLoadingState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  HomeInitialState();

  @override
  List<Object> get props => [];
}

class HomeToCreateTestState extends HomeState {
  HomeToCreateTestState();

  @override
  List<Object> get props => [];
}

class NewTestState extends HomeState {
  NewTestState({required this.newTest});

  final StudyTest newTest;

  @override
  List<Object> get props => [newTest];
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.errorMessage);

  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
