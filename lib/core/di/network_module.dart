import 'package:banking_app/core/helpers/http_helper.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt injector) async{

  injector.registerFactory(() => HttpHelper());

}