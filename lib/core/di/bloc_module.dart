import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt injector) async {
  injector.registerLazySingleton(() => AuthBloc(injector.get()));
}
