part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();
}

class RequestCardEvent extends CardEvent {
  int cardPin;
  int duressPin;

  RequestCardEvent(this.cardPin, this.duressPin);

  @override
  List<Object?> get props => [cardPin, duressPin];
}

class SetCardPinEvent extends CardEvent {
  final int cardPin;

  const SetCardPinEvent(this.cardPin);

  @override
  List<Object?> get props => [
        cardPin,
      ];
}

class SetCardDuressPinEvent extends CardEvent {
  final int duressPin;

  const SetCardDuressPinEvent(this.duressPin);

  @override
  List<Object?> get props => [
        duressPin,
      ];
}

class DeleteCardEvent extends CardEvent {
  final int id;

  const DeleteCardEvent(this.id);

  @override
  List<Object?> get props => [
        id,
      ];
}

class GetCardEvent extends CardEvent {
  const GetCardEvent();

  @override
  List<Object?> get props => [];
}
