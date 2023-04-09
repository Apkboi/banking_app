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
    on<GetCardEvent>(_mapGetCardEventToState);
    on<SetCardPinEvent>(_mapSetCardPinEventToState);
    on<SetCardDuressPinEvent>(_mapSetCardDuressPinEventToState);
    on<DeleteCardEvent>(_mapDeleteCardEventToState);
  }

  FutureOr<void> _mapRequestCardEventToState(
      RequestCardEvent event, Emitter<CardState> emit) async {
    emit(RequestCardLoadingState());

    try {
      State state =
          await cardRepository.requestCard(event.cardPin, event.duressPin);
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

  FutureOr<void> _mapGetCardEventToState(
      GetCardEvent event, Emitter<CardState> emit) async {
    emit(GetCardLoadingState());

    try {
      State state = await cardRepository.getCard();
      if (state is SuccessState) {
        RequestCardResponse response = state.value;
        emit(GetCardSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(GetCardFailureState(errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const GetCardFailureState('Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapSetCardPinEventToState(
      SetCardPinEvent event, Emitter<CardState> emit) async {
    emit(SetCardPinLoadingState());

    try {
      State state = await cardRepository.setCardPin(
        event.cardPin,
      );
      if (state is SuccessState) {
        RequestCardResponse response = state.value;
        emit(SetCardDuressPinSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(SetCardPinFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const SetCardPinFailureState('Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapSetCardDuressPinEventToState(
      SetCardDuressPinEvent event, Emitter<CardState> emit) async {
    emit(SetCardDuressPinLoadingState());

    try {
      State state = await cardRepository.setCardDuressPin(
        event.duressPin,
      );
      if (state is SuccessState) {
        RequestCardResponse response = state.value;
        emit(SetCardDuressPinSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(SetCardDuressPinFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const SetCardDuressPinFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapDeleteCardEventToState(
      DeleteCardEvent event, Emitter<CardState> emit) async {
    emit(DeleteCardLoadingState());

    try {
      State state = await cardRepository.deleteCard(
        event.id,
      );
      if (state is SuccessState) {
        RequestCardResponse response = state.value;
        emit(DeleteCardFailureState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(DeleteCardFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const DeleteCardFailureState('Something went wrong please retry'));
    }
  }
}
