import 'package:banking_app/app/presentation/widgets/circular_loader.dart';
import 'package:banking_app/app/presentation/widgets/search_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/features/transactions/presentation/blocs/transaction_bloc/transaction_bloc.dart';
import 'package:banking_app/features/transactions/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final transactionBloc = TransactionBloc(injector.get());

  @override
  void initState() {
    transactionBloc.add(GetAllTransactionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              LineIcon.barChartAlt(),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Transaction History',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Expanded(child: SearchField()),
              SizedBox(
                width: 8,
              ),
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.rectangle,
              //       color: Theme.of(context).cardColor,
              //       borderRadius: BorderRadius.circular(8)),
              //   child: Center(child: LineIcon.calendar()),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.rectangle,
              //       color: Theme.of(context).cardColor,
              //       borderRadius: BorderRadius.circular(8)),
              //   child: Center(child: LineIcon.sort()),
              // )
            ],
          ),
          const SizedBox(
            height: 20,
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
                    itemCount: state.response.transactions!.length,
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
    );
  }
}
