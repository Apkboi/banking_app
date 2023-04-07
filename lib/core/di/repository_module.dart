
import 'package:banking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:banking_app/features/auth/dormain/repos/auth_repository.dart';
import 'package:banking_app/features/cards/data/repository/cards_repository_impl.dart';
import 'package:banking_app/features/cards/dormain/repository/cards_repository.dart';
import 'package:banking_app/features/profile/data/repository/local/profile_store_impl.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';
import 'package:banking_app/features/transactions/data/repos/transaction_repository_impl.dart';
import 'package:banking_app/features/transactions/dormain/repos/transaction_repository.dart';
import 'package:get_it/get_it.dart';

Future<void>init(GetIt injector)async {
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector.get()));
  injector.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(injector.get()));
  injector.registerLazySingleton<CardsRepository>(() => CardRepositoryImpl(injector.get()));
  injector.registerSingleton<ProfileStore>(ProfileStoreImpl());
}