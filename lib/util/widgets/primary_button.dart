import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/util/app_dimensions.dart";

class PrimaryButton extends StatelessWidget {

  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final GestureTapCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralProvider>(context, listen: false);

    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: double.infinity,
      child: TextButton(
        key: UniqueKey(),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: general.getTheme.primaryColor,
          backgroundColor: general.getTheme.primaryColorDark,
        ),
        child: Text(title),
      ),
    );
  }
}
