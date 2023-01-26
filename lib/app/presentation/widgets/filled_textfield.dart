import 'package:banking_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilledTextField extends StatefulWidget {
  final String hint;
  final Widget? suffix;
  final Widget? preffix;
  final int? maxLine;
  final TextInputType? inputType;
  final TextEditingController? controller;

  final String? Function(String?)? validator;

  final String? Function(String?)? onChanged;

  const FilledTextField(
      {Key? key,
      required this.hint,
      this.suffix,
      this.validator,
      this.preffix,
      this.maxLine,
      this.inputType,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        maxLines: widget.maxLine,
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        decoration: AppTheme.filledTextFieldDecoration.copyWith(
            fillColor: Theme.of(context).cardColor,
            hintText: widget.hint,
            suffixIcon: widget.suffix,
            prefixIcon: widget.preffix,
            suffixIconColor: Theme.of(context).colorScheme.primary,
            hintStyle: TextStyle(color: Colors.grey.shade500)),
      ),
    );
  }
}
