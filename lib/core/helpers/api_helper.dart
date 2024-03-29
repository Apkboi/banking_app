import 'dart:developer';
import 'dart:io';
import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiConstants {
  ApiConstants._();

  static const baseUrl = "https://developed.paybliz.com/";
}

class SimplifyApiConsuming {
  SimplifyApiConsuming._();

  ///A more simplified method for making endpoint request call
  ///@param [requestFunction] a function passed, this function is the api call to execute
  ///@param [isStatusCode] a bool flag to indicate whether to equate response success with statusCode or with success string in response data
  ///@Param [statusCodeSuccess] an [int] status code to validate success of the request, if [isStatusCode] == true
  ///@Param [successResponse] a [Function] to execute if request is successful, must have a return statement
  /// Returns [Future<ResponseModel>]
  static Future<State> makeRequest(
      Future<Response<dynamic>> Function() requestFunction,
      {bool isStatusCode = true,
      int statusCodeSuccess = 200,
      required State Function(dynamic data) successResponse,
      State Function(Response data)? errorResponse,
      State Function(Response data)? dioErrorResponse,
      Function(int)? statusCode}) async {
    try {
      return await _makeRequest(requestFunction, isStatusCode,
          statusCodeSuccess, successResponse, errorResponse!);
    } on SocketException {
      return State<ServerErrorModel>.error(
        const ServerErrorModel(
            statusCode: 400,
            errorMessage: "Something went wrong "
                "please check your internet connection and try again",
            data: null),
      );
    } on DioError catch (e) {
      log(e.message);
      debugPrint("dio error request is ${e.response?.data}");
      if (e.type == DioErrorType.response) {
        if (dioErrorResponse != null) {
          return dioErrorResponse(e.response!);
        } else {
          return State<ServerErrorModel>.error(
            ServerErrorModel(
                statusCode: e.response!.statusCode ?? 400,
                errorMessage: "Something went wrong please try again",
                data: null),
          );
        }
      } else {
        return State<ServerErrorModel>.error(
          const ServerErrorModel(
              statusCode: 400,
              errorMessage: "Something went wrong please try again",
              data: null),
        );
      }
    } catch (error, stack) {
      debugPrint('error --------------------- ${error.toString()}');
      debugPrint('stack --------------------- ${stack.toString()}');

      return State<ServerErrorModel>.error(
        ServerErrorModel(
            statusCode: 400, errorMessage: error.toString(), data: null),
      );
    }
  }

  static Future<State> _makeRequest(
      Future<Response> Function() requestFunction,
      bool isStatusCode,
      int statusCodeSuccess,
      State Function(dynamic data) successResponse,
      State Function(Response data) errorResponse) async {
    var response = await requestFunction();

    if (isStatusCode) {
      return _handleResponseBasedOnStatusCode(
          response, statusCodeSuccess, successResponse, errorResponse);
    } else {
      return _handleResponseBasedOnDataReturned(
          response, successResponse, errorResponse);
    }
  }

  static Future<State> _handleResponseBasedOnStatusCode(
      Response response,
      int statusCodeSuccess,
      State Function(dynamic data) successResponse,
      State Function(Response data) errorResponse) async {
    if (response.statusCode == statusCodeSuccess) {
      return successResponse(response.data);
    } else {
      return errorResponse(response);
    }
  }

  static State _handleResponseBasedOnDataReturned(
      Response response,
      State Function(dynamic data) successResponse,
      State Function(Response data) errorResponse) {
    if (response.data['status'].toString() == 'true') {
      log('STATUS :${response.data['status']}');
      return successResponse(response.data);
    } else {
      return errorResponse(response);
    }
  }
}
