import 'dart:developer';

import 'package:banking_app/app/presentation/widgets/circular_loader.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/extension.dart';
import 'package:banking_app/features/home/presentation/widgets/topup_sheet.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';
import 'package:banking_app/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:banking_app/features/transactions/presentation/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:banking_app/features/transactions/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  late ProfileBloc bloc;
  final transactionBloc = TransactionBloc(injector.get());
  String balance = '0';

  @override
  void initState() {
    super.initState();
    bloc = injector.get<ProfileBloc>();
    bloc.add(GetCachedUserEvent());
    transactionBloc.add(GetAllTransactionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is CachedProfileFetchedState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello ${state.profile.fullname},',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blueGrey,
                            child: Center(
                                child: Image.asset(
                                    'assets/gif/sign_up_emoji.gif')),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      _BalanceWidget(balance: balance),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: SizedBox(
            //         height: 80,
            //         child: ListView.builder(
            //           physics: const BouncingScrollPhysics(),
            //           itemBuilder: (context, index) => const BeneficiaryItem(),
            //           shrinkWrap: true,
            //           itemCount: 6,
            //           scrollDirection: Axis.horizontal,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 6,
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: LineIcon.arrowCircleRight(),
            //     )
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Today ${DateTime.now().formatToSringDate}',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocConsumer<TransactionBloc, TransactionState>(
                bloc: transactionBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetAllTransactionSucessState) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) => TransactionItem(
                        transaction: state.response.transactions![index],
                      ),
                    );
                  }
                  if (state is GetAllTransactionLoadingState) {
                    return Center(
                      child: CircularLoader(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BalanceWidget extends StatefulWidget {
  const _BalanceWidget({Key? key, required this.balance}) : super(key: key);
  final String balance;

  @override
  State<_BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<_BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
              image: AssetImage(
                'assets/jpeg/card_bg.jpeg',
              ),
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Balance',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'NGN ${widget.balance}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              log((await injector.get<ProfileStore>().getUserProfile())!
                  .fullname
                  .toString());
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => const TopUpSheet(),
              );
            },
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
