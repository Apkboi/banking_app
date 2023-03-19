part of 'card_bloc.dart';

abstract class CardState extends Equatable {
  const CardState();
}

class CardInitial extends CardState {
  @override
  List<Object> get props => [];
}

class RequestCardLoadingState extends CardState {
  @override
  List<Object?> get props => [];
}
class RequestCardSucessState extends CardState {
  final RequestCardResponse response;

  const RequestCardSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class RequestCardFailureState extends CardState {
  final String error;

  @override
  List<Object?> get props => [];

  const RequestCardFailureState(this.error);
}
