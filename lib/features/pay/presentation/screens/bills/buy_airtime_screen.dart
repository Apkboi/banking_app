import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:flutter/material.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Airtime recharge'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
             Text(' #Recent numbers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onPrimary),),
            const SizedBox(height: 10,),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children:  const [
                     CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Center(
                          child: Text('MTN',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),
                        ),
                      ),
                     SizedBox(
                        height: 8,
                      ),
                      Text('0801234567',style: TextStyle(fontSize: 13,color: Colors.grey),)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 16,
                  ),
                   Text('Amount',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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
                   Text('Select Network',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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
                            Icons.network_cell_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Search for network',
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
                   Text('Phone Number',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  const SizedBox(
                    height: 5,
                  ),
                  const OutlinedFormField(
                    hint: 'Enter Phone Number',
                    preffix: Icon(
                      Icons.numbers,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                ],
              ),
            ),
            Column(
              children: [
                CustomButton(onPressed: () {}, child: const Text('Recharge')),
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
