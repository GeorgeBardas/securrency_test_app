import "package:flutter/material.dart";
import "package:securrency_test_app/util/app_dimensions.dart";

class SecondaryButton extends StatelessWidget {

  const SecondaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final GestureTapCallback? onPressed;


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: double.infinity,
      child: TextButton(
        key: UniqueKey(),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
