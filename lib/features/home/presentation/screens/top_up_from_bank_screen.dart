import 'package:banking_app/app/presentation/widgets/copy_widget.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:flutter/material.dart';

import '../widgets/banks_item.dart';

class TopUpFromBankScreen extends StatefulWidget {
  const TopUpFromBankScreen({Key? key}) : super(key: key);

  @override
  State<TopUpFromBankScreen> createState() => _TopUpFromBankScreenState();
}

class _TopUpFromBankScreenState extends State<TopUpFromBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Receive from bank',
          style: TextStyle(fontSize: 16),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Receive using your Account details',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'You can receive funds from a bank using your account details below ⤵️.',
                    style: TextStyle(fontSize: 13,color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    'Account Number',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.numbers,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            '1234321234',
                            maxLines: 1,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.copy_all,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    'Account Name',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Williams cherechi Williams',
                            maxLines: 1,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.copy_all,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'USSD transfer',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Receive funds from different banks using ussd transfer.',
                    style: TextStyle(fontSize: 13,color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>  BanksItem(selected: index ==0),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const OutlinedFormField(
                    hint: 'Enter Amount',
                    inputType: TextInputType.number,
                    preffix: Icon(
                      Icons.attach_money,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    'USSD CODE',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '*123*233333*400#',
                            maxLines: 1,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16),
                          ),
                        ),
                        const CopyWidget()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
