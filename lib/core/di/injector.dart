import 'package:get_it/get_it.dart';
import 'package:banking_app/core/di/network_module.dart' as network_module;
import 'package:banking_app/core/di/repository_module.dart' as repository_module;
import 'package:banking_app/core/di/bloc_module.dart' as bloc_module;

final injector = GetIt.I;

Future<void> setup() async {

  await network_module.init(injector);
  await repository_module.init(injector);
  await bloc_module.init(injector);


   // await local_module.init(injector);
  // await service_module.init(injector);
  // await cubit_module.init(injector);
}