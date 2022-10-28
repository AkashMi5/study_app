import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/models/study_test.dart';
import 'package:study_app/screens/create_test/view/create_test_view.dart';
import 'package:study_app/screens/home/bloc/home_bloc.dart';
import 'package:study_app/screens/home/bloc/home_event.dart';
import 'package:study_app/screens/home/bloc/home_state.dart';
import 'package:study_app/widgets/buttons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<StudyTest>? testList;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    testList = [
      StudyTest(testName: 'Physics Mock#5', dateTime: DateTime.now()),
      StudyTest(testName: 'Physics Mock#6', dateTime: DateTime.now()),
      StudyTest(testName: 'Maths Mock#1', dateTime: DateTime.now()),
      StudyTest(testName: 'Maths Mock#2', dateTime: DateTime.now()),
      StudyTest(testName: 'Chemistry Mock#9', dateTime: DateTime.now()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeLoadingEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          //listen for one time events
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const Text(
                    'Mock Test App',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/home_image.webp',
                    height: cHeight * 0.3,
                    width: 190,
                  ),
                  Center(
                    child: ConfirmButton(
                      isActive: true,
                      buttonText: 'Create New Test',
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CreateTestView()))
                            .then((value) {
                          testList!.add(value as StudyTest);
                          setState(() {});
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (testList != null && testList!.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: testList!.length,
                          itemBuilder: (context, index) => Card(
                                elevation: 6.0,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Container(
                                  height: cHeight * 0.12,
                                  width: cWidth * 0.86,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white70,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          testList![index].testName,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Created on:',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              testList![index]
                                                  .dateTime
                                                  .toIso8601String(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
