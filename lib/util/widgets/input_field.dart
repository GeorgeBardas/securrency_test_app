import "package:flutter/material.dart";
import "package:form_field_validator/form_field_validator.dart";
import "package:provider/provider.dart";
import "package:securrency_test_app/providers/general_provider.dart";
import "package:securrency_test_app/util/app_dimensions.dart";
import "package:securrency_test_app/util/images.dart";

class InputField extends StatefulWidget {

  const InputField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.label,
    this.onTap,
    this.mandatory = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.isObscured = false,
    this.canToggleObscure = false,
    this.validators = const [],
    this.fieldController,
    this.autocorrect = false,
    this.errorText,
    this.focusNode,
    this.enabled = true,
  }) : super(key: key);

  final String? initialValue;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? label;
  final GestureTapCallback? onTap;
  final bool mandatory;
  final bool readOnly;
  final bool enabled;
  final TextInputType keyboardType;
  final int maxLines;
  final bool isObscured;
  final bool canToggleObscure;
  final List<TextFieldValidator> validators;
  final TextEditingController? fieldController;
  final bool autocorrect;
  final String? errorText;
  final FocusNode? focusNode;

  @override
  State<StatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController? _fieldController;
  late bool isObscured;
  String? fieldValue;
  String? errorText;

  GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    if (widget.fieldController == null) {
      _fieldController = TextEditingController(text: widget.initialValue);
    } else {
      _fieldController = widget.fieldController;
      _fieldController?.text = widget.initialValue ?? "";
    }

    fieldValue = _fieldController!.text;
    isObscured = widget.isObscured;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (_, store, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildChildren(store),
      );
    },);
  }

  List<Widget> _buildChildren(GeneralProvider general) {
    final List<Widget> builder = [];

    String? labelText;
    if (widget.label != null) {
      labelText = "${widget.label}";
    }
    final String? errorText = widget.errorText;

    if (labelText != null) {
      final labelWidget = Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.defaultPadding),
        child: Row(
          children: [
            Text(
              labelText,
            ),
            Text(
              widget.mandatory ? "*" : "",
            ),
          ],
        ),
      );

      builder.add(labelWidget);
    }

    final inputContainer = TextFormField(
      controller: _fieldController,
      key: fieldKey,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      autocorrect: widget.autocorrect,
      validator: MultiValidator(widget.validators),
      enabled: widget.enabled,
      decoration: InputDecoration(
        filled: true,
        disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(20.0),
        hintText: widget.hintText,
        errorMaxLines: 2,
        errorText: errorText,
        focusColor: const Color.fromRGBO(0, 0, 0, 0),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: widget.canToggleObscure
                ? InkWell(
              child: IconButton(
                icon: isObscured
                    ? Images.inputIconVisible
                    : Images.inputIconVisible,
                onPressed: _toggleObscureText,
              ),
            )
                : (widget.suffixWidget != null
                ? IconButton(icon: widget.suffixWidget!, onPressed: null)
                : null),),
      ),
      obscureText: isObscured,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      onChanged: _updateValue,
      onTap: widget.onTap,
    );
    builder.add(inputContainer);

    const spacing = SizedBox(height: AppDimensions.smallMediumPadding);
    builder.add(spacing);

    return builder;
  }

  void _toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  void _updateValue(String value) {
    setState(() {
      fieldValue = value;
    });
  }
}
