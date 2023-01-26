import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:flutter/material.dart';
class BataToBeta extends StatefulWidget {
  const BataToBeta({Key? key}) : super(key: key);

  @override
  State<BataToBeta> createState() => _BataToBetaState();
}

class _BataToBetaState extends State<BataToBeta> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Beta Username'),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).cardColor),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.alternate_email_rounded,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Search for beta account',
                              maxLines: 1,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
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
                  const Text('Account Number'),
                  const SizedBox(
                    height: 5,
                  ),
                  const OutlinedFormField(
                    hint: 'Enter Account Number',
                    preffix: Icon(
                      Icons.numbers,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Amount'),
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
                  const Text('Transaction Category'),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).cardColor),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.bar_chart,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Select transaction category',
                              maxLines: 1,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
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
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Narration'),
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
            Column(children: [
              CustomButton(onPressed: (){}, child: const Text('Send')),
              const SizedBox(height: 60,)
            ],)
          ],
        ),
      ),
    );
  }
}
