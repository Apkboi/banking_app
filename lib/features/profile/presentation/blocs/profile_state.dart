part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class CachedProfileFetchedState extends ProfileState {
  final Profile profile;
  const CachedProfileFetchedState(this.profile);

  @override
  List<Object?> get props => [profile];
}
class CachedProfileLoadingState extends ProfileState {

  const CachedProfileLoadingState();

  @override
  List<Object?> get props => [];
}
