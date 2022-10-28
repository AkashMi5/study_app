import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final String? buttonText;
  final String? subText;
  final VoidCallback? onTap;
  final bool isActive;

  const ConfirmButton(
      {Key? key,
      required this.isActive,
      this.buttonText,
      this.subText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: isActive ? Colors.blue : Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: () {
            if (isActive) {
              onTap!();
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text(
                  buttonText!,
                  style: Theme.of(context).primaryTextTheme.button!.copyWith(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
