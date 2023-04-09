import 'package:banking_app/app/data/models/server_error_model.dart';
import 'package:banking_app/app/data/models/state.dart';
import 'package:banking_app/core/endpoints.dart';
import 'package:banking_app/core/helpers/api_helper.dart';
import 'package:banking_app/core/helpers/http_helper.dart';
import 'package:banking_app/features/cards/data/models/request_card_model.dart';
import 'package:banking_app/features/cards/dormain/repository/cards_repository.dart';
import 'package:flutter/foundation.dart';

class CardRepositoryImpl extends CardsRepository {
  final HttpHelper httpClient;

  CardRepositoryImpl(this.httpClient);

  @override
  Future<State> requestCard(int cardPin, int duressPin) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(CardEndpoints.requestCard, body: {
        'card_pin': cardPin,
        'duress_pin': duressPin,
      }),
      isStatusCode: false,
      successResponse: (data) {
        return State<RequestCardResponse?>.success(
            RequestCardResponse.fromJson(data));
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
  Future<State> setCardDuressPin(int duressPin) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(CardEndpoints.setCardDuressPin, body: {
        'duress_pin': duressPin,
      }),
      isStatusCode: false,
      successResponse: (data) {
        return State<RequestCardResponse?>.success(
            RequestCardResponse.fromJson(data));
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
  Future<State> setCardPin(int cardPin) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.post(CardEndpoints.setCardPin, body: {
        'card_pin': cardPin,
      }),
      isStatusCode: false,
      successResponse: (data) {
        return State<RequestCardResponse?>.success(
            RequestCardResponse.fromJson(data));
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
  Future<State> deleteCard(int id) {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.delete(
        '${CardEndpoints.deleteCard}/$id',
      ),
      isStatusCode: false,
      successResponse: (data) {
        return State<dynamic>.success(data);
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
  Future<State> getCard() {
    return SimplifyApiConsuming.makeRequest(
      () => httpClient.get(
        CardEndpoints.getCard,
      ),
      isStatusCode: false,
      successResponse: (data) {
        return State<RequestCardResponse?>.success(
            RequestCardResponse.fromJson(data));
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
