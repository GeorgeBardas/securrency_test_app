import "dart:typed_data";

import "package:flutter/material.dart";
import "package:securrency_test_app/util/app_dimensions.dart";

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({Key? key, required this.photo}) : super(key: key);

  final Uint8List photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.photoPlaceholderBorderRadius),
        child: Center(child: Image.memory(photo,)),
      ),
    );
  }
}
