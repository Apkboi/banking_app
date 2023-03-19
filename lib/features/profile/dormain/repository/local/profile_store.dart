import 'package:banking_app/features/auth/data/models/auth_success_response.dart';

abstract class ProfileStore {

  Future<void> cacheUser(Profile profile);
  Future<Profile>? getUserProfile();

}
