import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';

class ChangeCardDuressPinScreen extends StatefulWidget {
  const ChangeCardDuressPinScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCardDuressPinScreen> createState() =>
      _ChangeCardDuressPinScreenState();
}

class _ChangeCardDuressPinScreenState extends State<ChangeCardDuressPinScreen> {
  bool fieldsEnabled = true;

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Card Duress Pin',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NOTE : By changing your card duress pin, this pin will replace your already existing card duress pin.',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'New Pin',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 6,
            ),
            OutlinedFormField(
              hint: 'Enter New Pin.',
              preffix: LineIcon.lock(),
              enabled: fieldsEnabled,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              inputType: TextInputType.number,
              onChange: (v) {
                setState(() {});
              },
              controller: passwordController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter password'),
                MinLengthValidator(4,
                    errorText: 'Pin must be up to 4 characters')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Confirm pin',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 6,
            ),
            OutlinedFormField(
              hint: 'Re-enter Pin.',
              preffix: LineIcon.lock(),
              inputType: TextInputType.number,
              enabled: fieldsEnabled,
              controller: confirmPasswordController,
              onChange: (v) {
                setState(() {});
              },
              validator: MultiValidator([
                RequiredValidator(errorText: 'Pin mismatch'),
                ConfirmPasswordValidator(
                    errorText: 'Pin mismatch',
                    comparedPassword: passwordController.text.toString())
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                onPressed: () {
                  // widget.onValidate();
                },
                child: const Text('Change Pin')),
          ],
        ),
      ),
    );
  }
}
