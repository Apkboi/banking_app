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

class GetCardLoadingState extends CardState {
  @override
  List<Object?> get props => [];
}
class GetCardSucessState extends CardState {
  final RequestCardResponse response;

  const GetCardSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class GetCardFailureState extends CardState {
  final String error;

  @override
  List<Object?> get props => [];

  const GetCardFailureState(this.error);
}

class DeleteCardLoadingState extends CardState {
  @override
  List<Object?> get props => [];
}
class DeleteCardSucessState extends CardState {




  @override
  List<Object?> get props => [];
}
class DeleteCardFailureState extends CardState {
  final String error;

  @override
  List<Object?> get props => [];

  const DeleteCardFailureState(this.error);
}

class SetCardPinLoadingState extends CardState {
  @override
  List<Object?> get props => [];
}
class SetCardPinSucessState extends CardState {
  final RequestCardResponse response;

  const SetCardPinSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class SetCardPinFailureState extends CardState {
  final String error;

  @override
  List<Object?> get props => [];

  const SetCardPinFailureState(this.error);
}

class SetCardDuressPinLoadingState extends CardState {
  @override
  List<Object?> get props => [];
}
class SetCardDuressPinSucessState extends CardState {
  final RequestCardResponse response;

  const SetCardDuressPinSucessState(this.response);

  @override
  List<Object?> get props => [response];
}
class SetCardDuressPinFailureState extends CardState {
  final String error;

  @override
  List<Object?> get props => [];

  const SetCardDuressPinFailureState(this.error);
}
