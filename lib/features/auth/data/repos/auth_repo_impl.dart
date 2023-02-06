import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/core/endpoints.dart';
import 'package:banking_app/core/helpers/api_helper.dart';
import 'package:banking_app/core/helpers/http_helper.dart';
import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/auth/data/models/register_payload.dart';
import 'package:banking_app/features/auth/dormain/repos/auth_repository.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl extends AuthRepository {
  HttpHelper httpClient;

  AuthRepositoryImpl(this.httpClient);

  @override
  Future<State> register(RegisterPayload payload) async {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        AuthorizationEndpoints.registration,
        body: payload.toJson(),
      ),
      successResponse: (data) {
        return State<AuthSuccessResponse?>.success(
            AuthSuccessResponse.fromJson(data));
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
  Future<State> login(String email, String password) async {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        AuthorizationEndpoints.login,
        body: {'email': email, 'password': password},
      ),
      successResponse: (data) {
        return State<AuthSuccessResponse?>.success(
            AuthSuccessResponse.fromJson(data));
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
  Future<State> setDuressPin(String duressPin) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        AuthorizationEndpoints.setDuressPin,
        body: {"duress_pin": duressPin},
      ),
      successResponse: (data) {
        return State<AuthSuccessResponse?>.success(
            AuthSuccessResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString(),
              data: null),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data['message'].toString(),
              data: null),
        );
      },
    );
  }

  @override
  Future<State> setPassCode(String passcode) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        AuthorizationEndpoints.setPasscode,
        body: {"passcode":passcode},
      ),
      successResponse: (data) {
        return State<AuthSuccessResponse?>.success(
            AuthSuccessResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString(),
              data: null),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data['message'].toString(),
              data: null),
        );
      },
    );
  }

  @override
  Future<State> setTransactionPin(String transactionPin) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(
        AuthorizationEndpoints.setTransactionPin,
        body: {'transaction_pin': transactionPin},
      ),
      successResponse: (data) {
        return State<AuthSuccessResponse?>.success(
            AuthSuccessResponse.fromJson(data));
      },
      statusCodeSuccess: 200,
      errorResponse: (response) {
        debugPrint('ERROR SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString(),
              data: null),
        );
      },
      dioErrorResponse: (response) {
        debugPrint('DIO SERVER');
        return State<ServerErrorModel>.error(
          ServerErrorModel(
              statusCode: response.statusCode!,
              errorMessage: response.data['message'].toString(),
              data: null),
        );
      },
    );
  }
}
