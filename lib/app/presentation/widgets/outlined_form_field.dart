import 'package:flutter/material.dart';

class OutlinedFormField extends StatefulWidget {
  const OutlinedFormField(
      {Key? key,
      required this.hint,
      this.suffix,
      this.validator,
      this.preffix,
      this.maxLine,
      this.inputType,
      this.obscure,
      this.controller,
      this.onChange,
      this.onFieldSubmitted,
      this.enabled})
      : super(key: key);
  final String hint;
  final bool? obscure;
  final Widget? suffix;
  final Widget? preffix;
  final int? maxLine;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Function(String d)? onChange;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool? enabled;

  @override
  State<OutlinedFormField> createState() => _OutlinedFormFieldState();
}

class _OutlinedFormFieldState extends State<OutlinedFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        maxLines: widget.maxLine ?? 1,
        onChanged: widget.onChange,
        keyboardType: widget.inputType,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: widget.obscure == null ? false : widget.obscure!,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                gapPadding: 2,
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                gapPadding: 2,
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            fillColor: Theme.of(context).cardColor,
            hintText: widget.hint,
            suffixIcon: widget.suffix,
            prefixIcon: widget.preffix,
            enabled: widget.enabled ?? true,
            prefixIconColor: Colors.blueGrey,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            suffixIconColor: Theme.of(context).colorScheme.primary,
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
      ),
    );
  }
}
