import 'dart:developer';

import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/transactions/data/models/save_transaction_payload.dart';
import 'package:banking_app/features/transactions/presentation/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class BataToBeta extends StatefulWidget {
  const BataToBeta({Key? key}) : super(key: key);

  @override
  State<BataToBeta> createState() => _BataToBetaState();
}

class _BataToBetaState extends State<BataToBeta> {
  final accountNameController = TextEditingController();

  final transactionBloc = TransactionBloc(injector.get());
  final amountController = TextEditingController();
  final accountNumberController = TextEditingController();

  bool acountVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Beta Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   'Beta Username',
                    //   style: TextStyle(
                    //       color: Theme.of(context).colorScheme.onPrimary),
                    // ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: const EdgeInsets.all(20),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(8),
                    //         color: Theme.of(context).cardColor),
                    //     child: Row(
                    //       children: [
                    //         const Icon(
                    //           Icons.alternate_email_rounded,
                    //           size: 18,
                    //           color: Colors.grey,
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Expanded(
                    //           child: Text(
                    //             'Search for beta account',
                    //             maxLines: 1,
                    //             style: TextStyle(
                    //               color: Theme.of(context).colorScheme.onPrimary,
                    //             ),
                    //           ),
                    //         ),
                    //         const Icon(
                    //           Icons.arrow_drop_down_outlined,
                    //           size: 18,
                    //           color: Colors.grey,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Account Number',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    OutlinedFormField(
                      hint: 'Enter Account Number',
                      inputType: TextInputType.number,
                      controller: accountNumberController,
                      onChange: (val) {
                        if (val.length == 10) {
                          log(val);
                          transactionBloc.add(FetchUserDataEvent(val));
                        }
                      },
                      preffix: const Icon(
                        Icons.numbers,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocConsumer<TransactionBloc, TransactionState>(
                      bloc: transactionBloc,
                      listener: (context, state) {
                        if (state is SaveP2PTransactionLoadingState) {
                          AppUtils.showAnimatedProgressDialog(context);
                        }
                        if (state is SaveP2PTransactionSucessState) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          AppUtils.showTransferSuccessDialog(context,
                              onDone: () {},
                              transaction: state.response.transaction!);
                          // AppUtils.show(context);
                        }
                        if (state is SaveP2PTransactionFailureState) {
                          Navigator.pop(context);
                          AppUtils.showCustomToast(state.error);
                          // AppUtils.show(context);
                        }

                        if (state is FetchUserLoadingState) {
                          setState(() {
                            acountVerified = false;
                          });
                        }
                        if (state is FetchUserFailureState) {
                          AppUtils.showCustomToast(state.error);
                          acountVerified = false;
                        }
                        if (state is FetchUserSucessState) {
                          setState(() {
                            acountVerified = true;
                          });
                        }
                      },
                      builder: (context, state) {
                        if (state is FetchUserLoadingState) {
                          return Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          );
                        }
                        if (state is FetchUserSucessState) {
                          accountNameController.text =
                              state.response.user!.username!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Beta username',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              OutlinedFormField(
                                enabled: false,
                                controller: accountNameController,
                                preffix: const Icon(
                                  Icons.alternate_email_rounded,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Enter Account Name')
                                ]),
                                hint: 'Better Username Name',
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Amount',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    OutlinedFormField(
                      hint: 'Enter Amount',
                      inputType: TextInputType.number,
                      controller: amountController,
                      enabled: acountVerified,
                      preffix: const Icon(
                        Icons.attach_money,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    Text(
                      'Narration',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const OutlinedFormField(
                      hint: 'Enter transfer note.',
                      preffix: Icon(
                        Icons.note_alt_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                    onPressed: acountVerified
                        ? () {
                            AppUtils.showPinView(
                              context,
                              onDone: (pin) {
                                Navigator.pop(context);
                                makeTransaction(pin);
                              },
                              onCorrect: (pin) {},
                              onFailed: () {},
                            );
                          }
                        : null,
                    child: const Text('Send')),
                const SizedBox(
                  height: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void makeTransaction(String pin) async {
    transactionBloc.add(SaveP2PTransactionEvent(SaveTransactionPayload(
        status: 'successful',
        bankName: 'P2P',
        pin: pin,
        amount: int.parse(amountController.text),
        accountNumber: int.parse(accountNumberController.text),
        accountName: accountNameController.text)));
  }
}
