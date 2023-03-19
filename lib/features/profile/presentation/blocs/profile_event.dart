part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetCachedUserEvent extends ProfileEvent {


  @override
  List<Object?> get props => [];
}
