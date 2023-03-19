import 'dart:developer';

import 'package:banking_app/app/data/repository/local/hive_store_impl.dart';
import 'package:banking_app/app/data/repository/local/share_preference_store.dart';
import 'package:banking_app/core/constants/storage_keys.dart';
import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';

class ProfileStoreImpl extends ProfileStore {
  final store = SharedPreferenceStore();

  ProfileStoreImpl() {
    init();
  }

  @override
  Future<void> cacheUser(Profile profile) async {
    await store.set(HiveStoreKeys.userProfile, profile.toJson());
  }

  @override
  Future<Profile>? getUserProfile() async {
    var user = await store.get(HiveStoreKeys.userProfile);

    return Profile.fromJson(Map.from(user));
  }

  Future<void> init() => store.init();
}
