import 'package:flutter/material.dart';
import 'package:study_app/screens/create_test/bloc/create_test_bloc.dart';
import 'package:study_app/screens/create_test/bloc/create_test_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/screens/create_test/bloc/create_test_state.dart';
import 'package:study_app/models/study_test.dart';
import 'package:study_app/screens/create_test/models/topics.dart';
import 'package:study_app/widgets/buttons.dart';

class CreateTestView extends StatefulWidget {
  const CreateTestView({Key? key}) : super(key: key);

  @override
  State<CreateTestView> createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTestView> {
  String testName = '';
  List<Topic> studyTopics = [];
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    return BlocProvider<CreateTestBloc>(
        create: (BuildContext context) =>
            CreateTestBloc()..add(CreateTestLoadingEvent()),
        child: BlocListener<CreateTestBloc, CreateTestState>(
            listener: (context, state) {
          if (state is TestNameChangeState) {
            testName = state.testName;
          }
        }, child: BlocBuilder<CreateTestBloc, CreateTestState>(
                builder: (context, state) {
          if (state is TopicsFetchedState) {
            studyTopics = state.topics;
          } else if (state is CheckboxValueChangedState) {
            studyTopics = state.topics;
          }
          return SafeArea(
            child: Scaffold(
                // resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SizedBox(
                    height: cHeight,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                          width: cWidth,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.blue,
                                ),
                              ),
                              const Text('Create New Test'),
                              const SizedBox(
                                width: 1,
                              )
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: TestNameField(
                                    state: state, topics: studyTopics),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text('Topics',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueAccent)),
                              const SizedBox(
                                height: 15,
                              ),
                              if (state is TopicsFetchedState)
                                SizedBox(
                                    height: cHeight * 0.5,
                                    child: TopicList(topics: state.topics))
                              else if (state is CheckboxValueChangedState)
                                SizedBox(
                                    height: cHeight * 0.5,
                                    child: TopicList(topics: state.topics))
                              else if (state is TestNameChangeState)
                                SizedBox(
                                    height: cHeight * 0.5,
                                    child: TopicList(topics: state.topics))
                              else if (state is CreateTestLoadingState)
                                SizedBox(
                                  height: cHeight * 0.5,
                                  child: const Center(
                                    child: SizedBox(
                                      height: 30.0,
                                      width: 30.0,
                                      child: CircularProgressIndicator(
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: ConfirmButton(
                                  isActive: testName.length > 4 ? true : false,
                                  buttonText: 'Create',
                                  onTap: () {
                                    StudyTest newtest = StudyTest(
                                        testName: testName,
                                        dateTime: DateTime.now());
                                    Navigator.pop(context, newtest);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          );
        })));
  }
}

class TestNameField extends StatefulWidget {
  const TestNameField({Key? key, required this.state, required this.topics})
      : super(key: key);

  final CreateTestState state;
  final List<Topic> topics;

  @override
  State<TestNameField> createState() => _TestNameFieldState();
}

class _TestNameFieldState extends State<TestNameField> {
  late TextEditingController _testNameController;

  @override
  void initState() {
    _testNameController = TextEditingController();
    _testNameController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Colors.lightBlueAccent, width: 2),
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.assignment_ind,
              color: Colors.blueAccent,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              autofocus: false,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black87,
                  fontFamily: 'GilroySemiBold',
                  fontSize: 18.0),
              controller: _testNameController,
              onChanged: (val) {
                _testNameController
                  ..text = val
                  ..selection = TextSelection.collapsed(
                      offset: _testNameController.text.length);
                BlocProvider.of<CreateTestBloc>(context).add(
                    TestNameChangeEvent(
                        testName: _testNameController.text,
                        topics: widget.topics));
              },
              //  validator: (val) => isPhoneNumberValid(val) ? null : null,
              obscureText: false,
              decoration: const InputDecoration.collapsed(
                  hintText: "Test Name",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      color: Colors.black26,
                      fontWeight: FontWeight.normal,
                      fontSize: 18)),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}

class TopicList extends StatefulWidget {
  const TopicList({Key? key, required this.topics}) : super(key: key);

  final List<Topic> topics;

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  @override
  Widget build(BuildContext context) {
    List<Topic> topics = widget.topics;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: topics.length,
      itemBuilder: (context, index) => ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          title: Text(topics[index].topicName!),
          leading: SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: CheckboxListTile(
                value: topics[index].topicCheckboxValue,
                contentPadding: const EdgeInsets.all(0),
                controlAffinity: ListTileControlAffinity.leading,
                visualDensity: VisualDensity.compact,
                onChanged: (value) {
                  topics[index].topicCheckboxValue =
                      !topics[index].topicCheckboxValue;
                  if (topics[index].topicCheckboxValue == true) {
                    for (var concept in topics[index].concepts!) {
                      concept.conceptCheckboxValue = true;
                    }
                  } else {
                    for (var concept in topics[index].concepts!) {
                      concept.conceptCheckboxValue = false;
                    }
                  }
                  BlocProvider.of<CreateTestBloc>(context)
                      .add(CheckboxValueChangedEvent(topics: topics));
                }),
          ),
          children: [
            for (var concept in topics[index].concepts!)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(concept.conceptName!),
                    value: concept.conceptCheckboxValue,
                    onChanged: (value) {
                      concept.conceptCheckboxValue =
                          !concept.conceptCheckboxValue;
                      BlocProvider.of<CreateTestBloc>(context)
                          .add(CheckboxValueChangedEvent(topics: topics));
                    }),
              )
          ],
        ),
      ),
    );
  }
}
