import 'package:banking_app/app/data/models/get_banks_response.dart';
import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/app/data/models/verify_bank_response.dart';
import 'package:banking_app/app/dormain/repository/remote/paystack_repository.dart';
import 'package:banking_app/core/constants/constants.dart';
import 'package:banking_app/core/helpers/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PaystackRepositoryImpl extends PaystackRepository {
  static Dio? _client;

  static Future<Map<String, String>> _getHeaders({String? contentType}) async {
    final paystackToken = await Constants.paystackApiKey;
    Map<String, String> headers = {};
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = contentType ?? 'application/json';
    if (paystackToken != null) {
      headers['Authorization'] = 'Bearer $paystackToken';
    }

    return headers;
  }

  static Future<Dio> _getInstance(
      {bool enabledDioLogger = false, String? contentType}) async {
    _client ??= Dio();

    _client!.options.headers = await _getHeaders(contentType: contentType);
    if (enabledDioLogger) {
      _client?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 400,
        ),
      );
    }
    return _client!;
  }

  // Future<Response> getBanks(String account_number, String bank_code,
  //     {Options? options}) async {
  //   final instance = await (_getInstance(enabledDioLogger: false));
  //   return instance.get(
  //       'https://api.paystack.co/bank/resolve?account_number=$account_number&bank_code=$bank_code',
  //       options: options);
  //
  // }

  @override
  Future<State> verifyBankAccount(String accountNumber, String bankCode,
      {Options? options}) async {
    final instance = await (_getInstance(enabledDioLogger: true));
    return SimplifyApiConsuming.makeRequest(
      () => instance.get(
          'https://api.paystack.co/bank/resolve?account_number=$accountNumber&bank_code=$bankCode',
          options: options),
      successResponse: (data) {
        return State<VerifyAccountResponse?>.success(
            data != null ? VerifyAccountResponse.fromJson(data) : null);
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
              errorMessage: response.data['message'],
              data: null),
        );
      },
    );
  }

  @override
  Future<State> getBanks(String country, {Options? options}) async {
    final instance = await (_getInstance(enabledDioLogger: true));
    return SimplifyApiConsuming.makeRequest(
      () => instance.get('https://api.paystack.co/bank?country=$country',
          options: options),
      successResponse: (data) {
        return State<GetBanksResponse?>.success(
            data != null ? GetBanksResponse.fromJson(data) : null);
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
              errorMessage: response.data['message'],
              data: null),
        );
      },
    );
  }
}
