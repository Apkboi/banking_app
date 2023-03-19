import 'dart:async';
import 'dart:developer';

import 'package:banking_app/app/data/models/get_banks_response.dart';
import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/app/data/models/verify_bank_response.dart';
import 'package:banking_app/app/dormain/repository/remote/paystack_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'paystack_event.dart';

part 'paystack_state.dart';

class PaystackBloc extends Bloc<PaystackEvent, PaystackState> {
  final PaystackRepository paystackRepository;

  PaystackBloc(this.paystackRepository) : super(PaystackInitial()) {
    on<GetBankEvent>(_mapGetBankEventToState);
    on<VerifyAccountEvent>(_mapVerifyAccountEventToState);
  }

  Future<FutureOr<void>> _mapGetBankEventToState(
      GetBankEvent event, Emitter<PaystackState> state) async {
    try {
      emit(GetBanksLoadingState());

      final State state = await paystackRepository.getBanks(event.country);
      if (state is SuccessState) {
        // log(s);
        emit(GetBanksSuccessState(
          getBanksResponse: state.value,
        ));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(GetBanksFailureState(message: errorModel.errorMessage));
      }
    } catch (e) {
      emit(GetBanksFailureState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> _mapVerifyAccountEventToState(
      VerifyAccountEvent event, Emitter<PaystackState> state) async {
    try {
      emit(VerifyAccountLoadingState());

      final State? state = await paystackRepository.verifyBankAccount(
          event.accountNumber, event.bankCode);
      if (state is SuccessState) {
        // log(s);
        emit(VerifyAccountSuccessState(
          verifyAccountResponse: state.value,
        ));
      } else if (state is ErrorState) {
        ServerErrorModel errorModel = state.value;
        emit(VerifyAccountFailureState(message: errorModel.errorMessage));
      }
    } catch (e) {
      emit(VerifyAccountFailureState(message: e.toString()));
    }
  }
}
