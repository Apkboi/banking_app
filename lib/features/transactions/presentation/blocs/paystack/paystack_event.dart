part of 'paystack_bloc.dart';

abstract class PaystackEvent extends Equatable {
  const PaystackEvent();
}

class GetBankEvent extends PaystackEvent{
  String country;

  GetBankEvent(this.country);

  @override
  // TODO: implement props
  List<Object?> get props =>[country];

}
class VerifyAccountEvent extends PaystackEvent{
  String accountNumber;
  String bankCode;

  VerifyAccountEvent({required this.accountNumber,required this.bankCode});

  @override
  // TODO: implement props
  List<Object?> get props =>[accountNumber,bankCode];

}

