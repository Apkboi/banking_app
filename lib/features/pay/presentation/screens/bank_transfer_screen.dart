

import 'package:banking_app/app/data/models/get_banks_response.dart';
import 'package:banking_app/app/data/repository/remote/paystack_repository.dart';
import 'package:banking_app/app/presentation/blocs/paystack/paystack_bloc.dart';
import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/pay/presentation/widgets/choose_bank_dialog.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';
import 'package:banking_app/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:banking_app/features/transactions/data/models/save_transaction_payload.dart';
import 'package:banking_app/features/transactions/presentation/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({Key? key}) : super(key: key);

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  String? bankName;
  Bank? bank;
  final accountNameController = TextEditingController();
  final _paystackBloc = PaystackBloc(PaystackRepositoryImpl());
  final _transactionBloc = TransactionBloc(injector.get());
  bool acountVerified = false;
  bool isLoading = false;
  final accountNumberController = TextEditingController();
  final amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Bank Transfer'),
      ),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        bloc: _transactionBloc,
        listener: (context, state) {
          if (state is SaveTransactionLoadingState) {
            AppUtils.showAnimatedProgressDialog(context);
          }
          if (state is SaveTransactionSucessState) {
            injector.get<ProfileStore>().cacheUser(state.response.profile!);
            injector.get<ProfileBloc>().add(GetCachedUserEvent());
            Navigator.pop(context);
            Navigator.pop(context);
            AppUtils.showTransferSuccessDialog(context,
                onDone: () {}, transaction: state.response.transaction!);
            // AppUtils.show(context);
          }
          if (state is SaveTransactionFailureState) {
            Navigator.pop(context);
            AppUtils.showCustomToast(state.error);
            // AppUtils.show(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              context: context,
                              builder: (context) => ChooseBankDialog(
                                  onSelected: (selectedBank) {
                                Navigator.pop(context);
                                setState(() {
                                  bank = selectedBank;
                                  bankName = selectedBank.name;
                                });
                              }),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).cardColor),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_rounded,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    bankName ?? 'Search for bank',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Account Number',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OutlinedFormField(
                          hint: 'Enter Account Number',
                          enabled: !isLoading && bank != null,
                          controller: accountNumberController,
                          inputType: TextInputType.number,
                          onChange: (val) {
                            if (val.length == 10) {
                              _paystackBloc.add(VerifyAccountEvent(
                                  accountNumber:
                                      accountNumberController.text,
                                  bankCode: bank!.code));
                            }
                          },
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter Account Number'),
                            LengthRangeValidator(
                                min: 10,
                                max: 10,
                                errorText: 'Invalid account number')
                          ]),
                          preffix: const Icon(
                            Icons.numbers,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BlocConsumer<PaystackBloc, PaystackState>(
                          bloc: _paystackBloc,
                          listener: (context, state) {
                            if (state is VerifyAccountLoadingState) {
                              setState(() {
                                acountVerified = false;
                              });
                            }
                            if (state is VerifyAccountFailureState) {
                              AppUtils.showCustomToast(state.message);
                              acountVerified = false;
                            }
                            if (state is VerifyAccountSuccessState) {
                              setState(() {
                                acountVerified = true;
                              });
                            }
                          },
                          builder: (context, state) {
                            if (state is VerifyAccountLoadingState) {
                              return Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
                                  ),
                                ),
                              );
                            }
                            if (state is VerifyAccountSuccessState) {
                              accountNameController.text = state
                                  .verifyAccountResponse.data.accountName;

                              return OutlinedFormField(
                                enabled: false,
                                controller: accountNameController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Enter Account Name')
                                ]),
                                hint: 'Account Name',
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
                              color:
                                  Theme.of(context).colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OutlinedFormField(
                          hint: 'Enter Amount',
                          inputType: TextInputType.number,
                          controller: amountController,
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
                              color:
                                  Theme.of(context).colorScheme.onPrimary),
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
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        CustomButton(
                            onPressed: (!isLoading && acountVerified)
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
            ),
          );
        },
      ),
    );
  }

  void makeTransaction(String pin) async {
    _transactionBloc.add(SaveTransactionEvent(SaveTransactionPayload(
        status: 'successful',
        bankName: bankName,
        pin: pin,
        amount: int.parse(amountController.text),
        accountNumber: int.parse(accountNumberController.text),
        accountName: accountNameController.text)));
  }
}
