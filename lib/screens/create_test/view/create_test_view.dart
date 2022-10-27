import 'package:flutter/material.dart';

class CreateTestView extends StatefulWidget {
  const CreateTestView({Key? key}) : super(key: key);

  @override
  State<CreateTestView> createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTestView> {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 10,
            width: cWidth,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
                Text('Create New Test'),
                SizedBox(
                  width: 1,
                )
              ]),
          const SizedBox(
            height: 30,
          ),
          const TestNameField()
        ],
      ),
    ));
  }
}

class TestNameField extends StatefulWidget {
  const TestNameField({Key? key}) : super(key: key);

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
          Expanded(
            flex: 1,
            child: TextField(
              autofocus: false,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'GilroySemiBold',
                  fontSize: 18.0),
              controller: _testNameController,
              onChanged: (val) => _testNameController
                ..text = val
                ..selection = TextSelection.collapsed(
                    offset: _testNameController.text.length),
              //  validator: (val) => isPhoneNumberValid(val) ? null : null,
              obscureText: false,
              decoration: const InputDecoration.collapsed(
                  hintText: "Test Name",
                  hintStyle: TextStyle(
                      fontFamily: 'GilroySemiBold',
                      color: Colors.white,
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
