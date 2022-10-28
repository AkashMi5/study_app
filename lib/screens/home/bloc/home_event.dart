import 'package:equatable/equatable.dart';
import 'package:study_app/models/study_test.dart';

abstract class HomeEvent extends Equatable {}

class HomeLoadingEvent extends HomeEvent {
  HomeLoadingEvent();

  @override
  List<Object> get props => [];
}

class HomeToCreateTestEvent extends HomeEvent {
  HomeToCreateTestEvent();

  @override
  List<Object> get props => [];
}

class NewTestEvent extends HomeEvent {
  NewTestEvent({required this.newTest});

  final StudyTest newTest;

  @override
  List<Object> get props => [newTest];
}
