
import 'package:banking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:banking_app/features/auth/dormain/repos/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void>init(GetIt injector)async {
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector.get()));
}