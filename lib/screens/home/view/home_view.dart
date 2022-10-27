import 'package:flutter/material.dart';
import 'package:study_app/screens/create_test/view/create_test_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
            height: 90,
            width: cWidth,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const CreateTestView()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Text('This is home view')]),
            ),
          )
        ],
      ),
    ));
  }
}
