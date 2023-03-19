import 'dart:async';
import 'dart:developer';

import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/features/cards/data/models/request_card_model.dart';
import 'package:banking_app/features/cards/dormain/repository/cards_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardsRepository cardRepository;

  CardBloc(this.cardRepository) : super(CardInitial()) {
    on<CardEvent>((event, emit) {});

    on<RequestCardEvent>(_mapRequestCardEventToState);
  }

  FutureOr<void> _mapRequestCardEventToState(
      RequestCardEvent event, Emitter<CardState> emit) async {
    emit(RequestCardLoadingState());

    try {
      State state = await cardRepository.requestCard();
      if (state is SuccessState) {
        RequestCardResponse response = state.value;
        emit(RequestCardSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(RequestCardFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const RequestCardFailureState('Something went wrong please retry'));
    }
  }
}
