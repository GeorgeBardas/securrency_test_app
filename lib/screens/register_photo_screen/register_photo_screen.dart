import "dart:typed_data";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:image_picker/image_picker.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/networking/models/user.dart";
import "package:securrency_test_app/screens/register_photo_screen/register_photo_view_model.dart";
import "package:securrency_test_app/screens/register_summary_screen.dart";
import "package:securrency_test_app/util/app_dimensions.dart";
import "package:securrency_test_app/util/base_screen_state.dart";
import "package:securrency_test_app/util/widgets/photo_placeholder.dart";
import "package:securrency_test_app/util/widgets/photo_widget.dart";
import "package:securrency_test_app/util/widgets/primary_button.dart";

class RegisterPhotoScreen extends StatefulWidget {
  const RegisterPhotoScreen({Key? key, required this.userData}) : super(key: key);

  final User? userData;

  @override
  _RegisterPhotoScreenState createState() => _RegisterPhotoScreenState();
}

class _RegisterPhotoScreenState extends BaseScreenState<RegisterPhotoScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterPhotoViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.defaultPadding,
              right: AppDimensions.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppDimensions.largePadding,),
                Text(
                  AppLocalizations.of(context)!.register_photo_screen_title,
                  style: const TextStyle(
                    fontSize: AppDimensions.titleFontSize,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (viewModel.selectedPhoto == null) _photoPlaceholder()
                      else _buildPhoto(viewModel.selectedPhoto!),
                      const SizedBox(height: AppDimensions.defaultPadding,),
                      GestureDetector(
                        onTap: () => _onPhotoTap(viewModel),
                        child: const Icon(Icons.photo_camera),
                      )
                    ],
                  ),
                ),
                PrimaryButton(
                  title: AppLocalizations.of(context)!.register_photo_screen_next_button,
                  onPressed: () => _onButtonPressed(viewModel),
                ),
                const SizedBox(height: AppDimensions.defaultPadding,)
              ],
            ),
          ),
        ),
      );
    },);
  }
  
  void _onButtonPressed(RegisterPhotoViewModel viewModel) {
    if (viewModel.selectedPhoto != null) {
      widget.userData?.setPhoto(viewModel.selectedPhoto!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterSummaryScreen(userData: widget.userData),
        ),
      );
    } else {
      showErrorToast(AppLocalizations.of(context)!.register_photo_error);
    }
  }
  
  Future<void> _onPhotoTap(RegisterPhotoViewModel viewModel) async {
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo != null) {
      viewModel.setPhoto(await photo.readAsBytes());
    } 
  }

  Widget _photoPlaceholder() {
    return Center(
      child: PhotoPlaceholder(text: AppLocalizations.of(context)!.register_photo_placeholder_text,),
    );
  }

  Widget _buildPhoto(Uint8List photo) {
    return Center(
      child: PhotoWidget(photo: photo,),
    );
  }
}
