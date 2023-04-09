import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/core/helpers/validators.dart';
import 'package:banking_app/features/cards/presentation/blocs/card/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';

class ChangeCardPinScreen extends StatefulWidget {
  const ChangeCardPinScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCardPinScreen> createState() => _ChangeCardPinScreenState();
}

class _ChangeCardPinScreenState extends State<ChangeCardPinScreen> {
  bool fieldsEnabled = true;
  final pinController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bloc = CardBloc(injector.get());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Card Pin',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: BlocConsumer<CardBloc, CardState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SetCardPinLoadingState) {
            AppUtils.showAnimatedProgressDialog(context);
          }
          if (state is SetCardPinFailureState) {
            Navigator.pop(context);
            AppUtils.showCustomToast(state.error);
          }
          if (state is SetCardPinSucessState) {
            Navigator.pop(context);
            AppUtils.showCustomToast(state.response.message.toString());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NOTE : By changing card your pin, this pin will replace your already existing card pin.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'New Pin',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
                  controller: pinController,
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
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
                    RequiredValidator(errorText: 'Pin must not be empty'),
                    ConfirmPasswordValidator(
                        errorText: 'Pin mismatch',
                        comparedPassword: pinController.text.toString())
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
                      requestForCard();
                      // widget.onValidate();
                    },
                    child: const Text('Change Pin')),
              ],
            ),
          );
        },
      ),
    );
  }

  void requestForCard() {
    if (formKey.currentState!.validate()) {
      bloc.add(RequestCardEvent(
          int.parse(pinController.text), int.parse(pinController.text)));
    }
  }
}
