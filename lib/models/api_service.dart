import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exclusive_details_and_restorations/config.dart';
import 'package:exclusive_details_and_restorations/models/customer_model.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel model) async {
    var authToken =
        base64.encode(utf8.encode(Config.key + ":" + Config.secret));

    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerURL,
          data: model.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json'
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }
}
