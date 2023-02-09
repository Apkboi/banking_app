import 'package:banking_app/app/data/repository/local/hive_store_impl.dart';
import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';

class ProfileStoreImpl extends ProfileStore {
  final store = HiveStore('user_data');

  ProfileStoreImpl() {
    init();
  }

  @override
  Future<void> cacheUser(Profile profile) async {
    store.set('', profile);
  }

  @override
  Future<Profile>? getUserProfile() {
    store.get('');
    return null;
  }

  Future<void> init() async {
    await store.init();
  }
}
