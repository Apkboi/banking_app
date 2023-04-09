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

class RequestCardScreen extends StatefulWidget {
  const RequestCardScreen({Key? key}) : super(key: key);

  @override
  State<RequestCardScreen> createState() => _RequestCardScreenState();
}

class _RequestCardScreenState extends State<RequestCardScreen> {
  bool fieldsEnabled = true;

  final pinController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final duressPinController = TextEditingController();
  final confirmDuressPinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = CardBloc(injector.get());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request for card',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: BlocConsumer<CardBloc, CardState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is RequestCardLoadingState) {
            AppUtils.showAnimatedProgressDialog(context);
          }
          if (state is RequestCardFailureState) {
            Navigator.pop(context);
            AppUtils.showCustomToast(state.error);
          }
          if (state is RequestCardSucessState) {
            Navigator.pop(context);
            if (state.response.message == 'You already have a card') {
              Navigator.pop(context);
            } else {
              Navigator.pop(context);

              injector.get<CardBloc>().add(const GetCardEvent());
            }
            AppUtils.showCustomToast(state.response.message.toString());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Card Pin',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    OutlinedFormField(
                      hint: 'Enter Card Pin.',
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
                        RequiredValidator(errorText: 'Enter card pin'),
                        MinLengthValidator(4,
                            errorText: 'Pin must be up to 4 characters')
                      ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Confirm pin',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    OutlinedFormField(
                      hint: 'Re-enter  Card Pin.',
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
                            comparedPassword: pinController.text.toString())
                      ]),
                    ),
                    Text(
                      'Card Duress Pin',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    OutlinedFormField(
                      hint: 'Enter Card Duress Pin.',
                      preffix: LineIcon.lock(),
                      enabled: fieldsEnabled,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      inputType: TextInputType.number,
                      onChange: (v) {
                        setState(() {});
                      },
                      controller: duressPinController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Enter card duress pin'),
                        MinLengthValidator(4,
                            errorText: 'Pin must be up to 4 characters')
                      ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Confirm duress pin',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    OutlinedFormField(
                      hint: 'Re-enter Card duress Pin.',
                      preffix: LineIcon.lock(),
                      inputType: TextInputType.number,
                      enabled: fieldsEnabled,
                      controller: confirmDuressPinController,
                      onChange: (v) {
                        setState(() {});
                      },
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Pin mismatch'),
                        ConfirmPasswordValidator(
                            errorText: 'Pin mismatch',
                            comparedPassword:
                                duressPinController.text.toString())
                      ]),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomButton(
                        onPressed: () {
                          requestForCard();
                          // widget.onValidate();
                        },
                        child: const Text('Request')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void requestForCard() {
    if (formKey.currentState!.validate()) {
      bloc.add(RequestCardEvent(
          int.parse(pinController.text), int.parse(duressPinController.text)));
    }
  }
}
