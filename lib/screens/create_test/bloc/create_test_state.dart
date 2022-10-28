import 'package:equatable/equatable.dart';
import 'package:study_app/screens/create_test/models/topics.dart';

abstract class CreateTestState extends Equatable {}

class CreateTestLoadingState extends CreateTestState {
  CreateTestLoadingState();

  @override
  List<Object> get props => [];
}

class TopicsFetchedState extends CreateTestState {
  TopicsFetchedState({required this.topics});

  final List<Topic> topics;

  @override
  List<Object> get props => [topics];
}

class CheckboxValueChangedState extends CreateTestState {
  CheckboxValueChangedState({required this.topics});

  final List<Topic> topics;

  @override
  List<Object> get props => [topics];
}

class TestNameChangeState extends CreateTestState {
  TestNameChangeState({required this.testName, required this.topics});

  final String testName;
  final List<Topic> topics;

  @override
  List<Object> get props => [testName, topics];
}

class CreateTestErrorState extends CreateTestState {
  CreateTestErrorState(this.errorMessage);

  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
