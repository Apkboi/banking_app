import 'package:banking_app/features/auth/data/models/auth_success_response.dart';

abstract class ProfileRepository {

  Future<Profile> getUserProfile();
  Future<void> updateUserProfile(Profile profile);
  Future<void> deleteUserProfile();

}