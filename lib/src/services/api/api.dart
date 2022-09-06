import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ks_smart/src/model/detail_model.dart';

class Api {
  final uri = 'https://jsonplaceholder.typicode.com/users';
  Future<dynamic> fetchingData() async {
    try {
      final response = await Dio().get(uri);
      final List<DetailsModel> res = DetailsModel().detailModelListFromJson(response.data);
      log(res.toString());
      return res;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return 'Network Error';
      }
      log(e.error.toString());
      return 'error';
    }
  }
}
