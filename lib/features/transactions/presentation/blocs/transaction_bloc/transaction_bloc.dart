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
            errorModel.data ?? [errorModel.errorMessage]));
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
      State state = await transactionRepository.verifyTransaction(event.code,event.transId);
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
}
