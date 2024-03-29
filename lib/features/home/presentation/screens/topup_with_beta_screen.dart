import 'package:banking_app/app/presentation/widgets/copy_widget.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:banking_app/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpWithBetaScreen extends StatefulWidget {
  const TopUpWithBetaScreen({Key? key}) : super(key: key);

  @override
  State<TopUpWithBetaScreen> createState() => _TopUpWithBetaScreenState();
}

class _TopUpWithBetaScreenState extends State<TopUpWithBetaScreen> {
  late ProfileBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = injector.get<ProfileBloc>();
    bloc.add(GetCachedUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Receive from Beta bank',
          style: TextStyle(fontSize: 16),
        ),
        titleSpacing: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is CachedProfileFetchedState) {
            return Padding(
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
                          'Receive using your USERNAME',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'You can receive payment from a beta bank using the username below ⤵️.',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
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
                                  Icons.person_outline_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '@${state.profile.username}',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                const CopyWidget(),
                              ],
                            ),
                          ),
                        ),
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
                          'You can also  receive payment from a beta bank using your account details below⤵️.',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Account Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary),
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
                                  state.profile.accountNumber,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary),
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
                                  state.profile.fullname,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
