import "package:flutter/material.dart";
import "package:securrency_test_app/util/app_dimensions.dart";

class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(AppDimensions.photoPlaceholderBorderRadius),
      ),
      child: Center(child: Text(text)),
    );
  }
}
