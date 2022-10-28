import 'package:equatable/equatable.dart';
import 'package:study_app/screens/create_test/models/topics.dart';

abstract class CreateTestEvent extends Equatable {}

class CreateTestLoadingEvent extends CreateTestEvent {
  CreateTestLoadingEvent();

  @override
  List<Object> get props => [];
}

class FetchTopicsEvent extends CreateTestEvent {
  FetchTopicsEvent();

  @override
  List<Object> get props => [];
}

class CheckboxValueChangedEvent extends CreateTestEvent {
  CheckboxValueChangedEvent({required this.topics});

  final List<Topic> topics;

  @override
  List<Object> get props => [topics];
}

class TestNameChangeEvent extends CreateTestEvent {
  TestNameChangeEvent({required this.testName, required this.topics});

  final String testName;
  final List<Topic> topics;

  @override
  List<Object> get props => [testName, topics];
}
