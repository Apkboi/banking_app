import 'package:banking_app/app/data/models/state.dart';

abstract class CardsRepository{
  Future<State>requestCard();
}