import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/repository/test_topic_repository.dart';
import 'package:study_app/screens/create_test/bloc/create_test_event.dart';
import 'package:study_app/screens/create_test/bloc/create_test_state.dart';
import 'package:study_app/screens/create_test/models/topics.dart';

class CreateTestBloc extends Bloc<CreateTestEvent, CreateTestState> {
  TestTopicRepository testTopicRepository = TestTopicRepository();
  CreateTestBloc() : super(CreateTestLoadingState()) {
    on((event, emit) async {
      try {
        if (event is CreateTestLoadingEvent) {
          emit(CreateTestLoadingState());
          add(FetchTopicsEvent());
        } else if (event is FetchTopicsEvent) {
          List<Topic> topics = await testTopicRepository.getTopics();
          emit(TopicsFetchedState(topics: topics));
        } else if (event is CheckboxValueChangedEvent) {
          debugPrint('bloc ${event.topics[0].topicCheckboxValue}');
          emit(CheckboxValueChangedState(topics: event.topics));
          emit(TopicsFetchedState(topics: event.topics));
        } else {
          emit(CreateTestErrorState('Something went wrong!'));
        }
      } catch (e) {
        emit(CreateTestErrorState(e.toString()));
      }
    });
  }
}
