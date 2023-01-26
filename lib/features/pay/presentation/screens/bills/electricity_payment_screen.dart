import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:flutter/material.dart';
class ElectricityPaymentScreen extends StatefulWidget {
  const ElectricityPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ElectricityPaymentScreen> createState() => _ElectricityPaymentScreenState();
}

class _ElectricityPaymentScreenState extends State<ElectricityPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Electricity bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Electricity provider'),
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
                            Icons.lightbulb_outline_rounded,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Search for electricity provider',
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
                  const Text('Package'),
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
                            Icons.category_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Select package',
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
                  const Text('User ID'),
                  const SizedBox(
                    height: 5,
                  ),
                  const OutlinedFormField(
                    hint: 'Enter user ID',
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
                    height: 20,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(onPressed: () {}, child: const Text('Pay')),
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
}
