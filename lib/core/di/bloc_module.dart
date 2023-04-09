import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/cards/presentation/blocs/card/card_bloc.dart';
import 'package:banking_app/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt injector) async {
  injector.registerLazySingleton(() => AuthBloc(injector.get()));
  injector
      .registerLazySingleton(() => ProfileBloc(profileStore: injector.get()));
  injector.registerLazySingleton(() => CardBloc(injector.get()));
}
