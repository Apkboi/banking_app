import 'dart:async';
import 'dart:developer';

import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/features/transactions/data/models/all_transactions_response.dart';
import 'package:banking_app/features/transactions/data/models/fetch_users_response.dart';
import 'package:banking_app/features/transactions/data/models/get_transaction_response.dart';
import 'package:banking_app/features/transactions/data/models/save_transaction_payload.dart';
import 'package:banking_app/features/transactions/data/models/verify_transaction_response.dart';
import 'package:banking_app/features/transactions/dormain/repos/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';

part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionRepository transactionRepository;

  TransactionBloc(this.transactionRepository) : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetAllTransactionsEvent>(_mapGetAllTransactionsEventToState);
    on<GetTransactionEvent>(_mapGetTransactionEventToState);
    on<SaveTransactionEvent>(_mapSaveTransactionEventToState);
    on<VerifyTransactionEvent>(_mapVerifyTransactionEventToState);
    on<VerifyP2PTransactionEvent>(_mapVerifyP2PTransactionEventToState);
    on<SaveP2PTransactionEvent>(_mapSaveP2PTransactionEventToState);
    on<FetchUserDataEvent>(_mapFetchUserDataEventToState);
  }

  FutureOr<void> _mapGetAllTransactionsEventToState(
      GetAllTransactionsEvent event, Emitter<TransactionState> emit) async {
    emit(GetAllTransactionLoadingState());

    try {
      State state = await transactionRepository.getTransactions();
      if (state is SuccessState) {
        AllTransactionsResponse response = state.value;
        emit(GetAllTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(GetAllTransactionFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const GetAllTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapGetTransactionEventToState(
      GetTransactionEvent event, Emitter<TransactionState> emit) async {
    emit(GetTransactionLoadingState());

    try {
      State state = await transactionRepository.getTransaction(event.transId);
      if (state is SuccessState) {
        GetTransactionResponse response = state.value;
        emit(GetTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(GetTransactionFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const GetTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapSaveTransactionEventToState(
      SaveTransactionEvent event, Emitter<TransactionState> emit) async {
    emit(SaveTransactionLoadingState());

    try {
      State state = await transactionRepository.saveTransaction(event.payload);
      if (state is SuccessState) {
        GetTransactionResponse response = state.value;
        emit(SaveTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(SaveTransactionFailureState(
            errorModel.data[0] ?? [errorModel.errorMessage][0]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const SaveTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapVerifyTransactionEventToState(
      VerifyTransactionEvent event, Emitter<TransactionState> emit) async {
    emit(VerifyTransactionLoadingState());

    try {
      State state = await transactionRepository.verifyTransaction(
          event.code, event.transId);
      if (state is SuccessState) {
        VerifyTransactionResponse response = state.value;
        emit(VerifyTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(VerifyTransactionFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const VerifyTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapVerifyP2PTransactionEventToState(
      VerifyP2PTransactionEvent event, Emitter<TransactionState> emit) async {
    emit(VerifyP2PTransactionLoadingState());

    try {
      State state = await transactionRepository.verifyP2PTransaction(
          event.code, event.transId);
      if (state is SuccessState) {
        VerifyTransactionResponse response = state.value;
        emit(VerifyP2PTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(VerifyP2PTransactionFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const VerifyP2PTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapSaveP2PTransactionEventToState(
      SaveP2PTransactionEvent event, Emitter<TransactionState> emit) async {
    emit(SaveP2PTransactionLoadingState());

    try {
      State state =
          await transactionRepository.saveP2PTransaction(event.payload);
      if (state is SuccessState) {
        GetTransactionResponse response = state.value;
        emit(SaveP2PTransactionSucessState(state.value));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(SaveP2PTransactionFailureState(
            errorModel.data ?? [errorModel.errorMessage]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const SaveP2PTransactionFailureState(
          'Something went wrong please retry'));
    }
  }

  FutureOr<void> _mapFetchUserDataEventToState(
      FetchUserDataEvent event, Emitter<TransactionState> emit) async {
    emit(FetchUserLoadingState());

    try {
      State state =
          await transactionRepository.fetchUserData(event.accountNumber);
      if (state is SuccessState) {
        FetchUsersResponse response = state.value;
        emit(FetchUserSucessState(response));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(FetchUserFailureState(errorModel.data == null
            ? [errorModel.errorMessage][0]
            : errorModel.data[0]));
      }
    } on Exception catch (e, stack) {
      log('${e.toString()}${stack.toString()}');
      emit(const FetchUserFailureState('Something went wrong please retry'));
    }
  }
}
