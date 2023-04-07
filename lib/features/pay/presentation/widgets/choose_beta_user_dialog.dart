// import 'package:flutter/material.dart';
//
// class ChooseBankDialog extends StatefulWidget {
//   const ChooseBankDialog({Key? key, required this.onSelected, this.items})
//       : super(key: key);
//   final Function(Bank val) onSelected;
//   final List<Bank>? items;
//
//   @override
//   State<ChooseBankDialog> createState() => _ChooseBankDialogState();
// }
//
// class _ChooseBankDialogState extends State<ChooseBankDialog> {
//   List<Bank> list = [];
//   List<Bank> filteredList = [];
//   PaystackBloc paystackBloc = PaystackBloc(PaystackRepositoryImpl());
//
//   @override
//   void initState() {
//     filteredList = list;
//     paystackBloc.add(GetBankEvent('Nigeria'));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PaystackBloc, PaystackState>(
//         listener: (context, state) {
//           if (state is GetBanksSuccessState) {
//             log(state.getBanksResponse.data.length.toString());
//             setState(() {
//               list = state.getBanksResponse.data;
//               filteredList = state.getBanksResponse.data;
//             });
//           }
//         },
//         bloc: paystackBloc,
//         builder: (context, state) {
//           return state is GetBanksLoadingState?
//               ? Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                         width: 30,
//                         child: CircularProgressIndicator(
//                             color: Theme.of(context).colorScheme.onPrimary),
//                       ),
//                       const SizedBox(
//                         width: 16.0,
//                       ),
//                       Text(
//                         'Fetching  Banks...',
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.onPrimary),
//                       )
//                     ],
//                   ),
//                 )
//               : state is GetBanksSuccessState
//                   ? Container(
//                       height: MediaQuery.of(context).size.height * 2,
//                       color: Theme.of(context).scaffoldBackgroundColor,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 16),
//                       child: SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.9,
//                         child: state.getBanksResponse.data.isNotEmpty
//                             ? Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     'Select a bank',
//                                     style: TextStyle(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onPrimary,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   const SizedBox(
//                                     height: 16,
//                                   ),
//                                   OutlinedFormField(
//                                     hint: 'Search Saved Banks',
//                                     onChange: (val) {
//                                       filter(val);
//                                     },
//                                   ),
//                                   Expanded(
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       itemCount: filteredList.length,
//                                       itemBuilder: (context, index) => InkWell(
//                                         onTap: () {
//                                           widget
//                                               .onSelected(filteredList[index]);
//                                         },
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(
//                                             filteredList[index].name,
//                                             style: TextStyle(
//                                                 color: Theme.of(context)
//                                                     .colorScheme
//                                                     .onPrimary,
//                                                 fontSize: 16),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : AppPromptWidget(
//                                 canTryAgain: true,
//                                 imagePath: 'assets/images/png/empty.png',
//                                 message: 'No Banks Available please retry',
//                                 retryText: 'Retry',
//                                 onTap: () {
//                                   paystackBloc.add(GetBankEvent('Nigeria'));
//                                 },
//                               ),
//                       ),
//                     )
//                   : state is GetBanksFailureState
//                       ? AppPromptWidget(
//                           canTryAgain: true,
//                           onTap: () {
//                             paystackBloc.add(GetBankEvent('Nigeria'));
//                           })
//                       : Container();
//         });
//   }
//
//   void filter(String val) {
//     setState(() {
//       if (val.isNotEmpty) {
//         filteredList = list
//             .where((element) =>
//                 element.name.toLowerCase().contains(val.toLowerCase()))
//             .toList();
//       } else {
//         filteredList = list;
//       }
//     });
//   }
// }
