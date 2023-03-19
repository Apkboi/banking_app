import 'dart:async';
import 'dart:developer';

import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileStore profileStore;

  ProfileBloc({required this.profileStore}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {

    });

    on<GetCachedUserEvent>(_mapGetCachedUserEvent);
  }

  FutureOr<void> _mapGetCachedUserEvent(
      GetCachedUserEvent event, Emitter<ProfileState> emit) async {
    emit(const CachedProfileLoadingState());
    try {
      // await profileStore.i
      final profile = await profileStore.getUserProfile();
      emit(CachedProfileFetchedState(profile!));
    } on Exception catch (e) {
    }
  }
}
