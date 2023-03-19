import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/core/endpoints.dart';
import 'package:banking_app/core/helpers/api_helper.dart';
import 'package:banking_app/core/helpers/http_helper.dart';
import 'package:banking_app/features/transactions/data/models/all_transactions_response.dart';
import 'package:banking_app/features/transactions/data/models/fetch_users_response.dart';
import 'package:banking_app/features/transactions/data/models/get_transaction_response.dart';
import 'package:banking_app/features/transactions/data/models/save_transaction_payload.dart';
import 'package:banking_app/features/transactions/data/models/verify_transaction_response.dart';
import 'package:banking_app/features/transactions/dormain/repos/transaction_repository.dart';
import 'package:flutter/foundation.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final HttpHelper httpClient;

  TransactionRepositoryImpl(this.httpClient);

  @override
  Future<State> fetchUserData() {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        TransactionEndpoints.fetchUserData,
        body: {},
      ),
      successResponse: (data) {
        return State<FetchUsersResponse?>.success(
            FetchUsersResponse.fromJson(data));
      },
      isStatusCode: false,
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> getTransactions() {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.get(
        TransactionEndpoints.transactions,
      ),
      isStatusCode: false,
      successResponse: (data) {
        return State<AllTransactionsResponse?>.success(
            AllTransactionsResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> saveTransaction(SaveTransactionPayload payload) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(TransactionEndpoints.transactions,
          body: payload.toJson()),
      isStatusCode: false,
      successResponse: (data) {
        return State<GetTransactionResponse?>.success(
            GetTransactionResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> verifyTransaction(String code, String transId) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post('${TransactionEndpoints.verifyTransaction}$transId',
          body: {"code": code}),
      isStatusCode: false,
      successResponse: (data) {
        return State<VerifyTransactionResponse?>.success(
            VerifyTransactionResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> saveP2PTransaction(SaveTransactionPayload payload) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(TransactionEndpoints.p2PTransaction,
          body: payload.toJson()),
      isStatusCode: false,
      successResponse: (data) {
        return State<VerifyTransactionResponse?>.success(
            VerifyTransactionResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> verifyP2PTransaction(String code, String transId) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
          '${TransactionEndpoints.verifyP2PTransaction}$transId',
          body: {"code": code}),
      isStatusCode: false,
      successResponse: (data) {
        return State<VerifyTransactionResponse?>.success(
            VerifyTransactionResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }

  @override
  Future<State> getTransaction(String transId) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.get(
        '${TransactionEndpoints.transactions}$transId',
      ),
      isStatusCode: false,
      successResponse: (data) {
        return State<GetTransactionResponse?>.success(
            GetTransactionResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: 'Something went wrong',
              data: (response.data['errors'] as List)
                  .map((e) => e.toString())
                  .toList()),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: "Something went wrong please retry!! ",
              data: (response.data['errors'] as List)
                      .map((e) => e.toString())
                      .toList() ??
                  response.data),
        );
      },
    );
  }
}
