import 'package:banking_app/app/data/models/state.dart';

abstract class CardsRepository{
  Future<State>requestCard(int cardPin,int duressPin);
  Future<State>setCardPin(int cardPin,);
  Future<State>setCardDuressPin(int duressPin);
  Future<State>deleteCard(int id);
  Future<State>getCard();
}