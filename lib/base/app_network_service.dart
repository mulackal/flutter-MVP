import 'dart:async';
import 'dart:convert';



import 'package:flutter_app_mvp/base/FetchDataException.dart';
import 'package:flutter_app_mvp/base/app_repository.dart';
import 'package:flutter_app_mvp/model/home_data.dart';
import 'package:http/http.dart' as http;

class AppNetworkRepository implements AppRepository {

  String url = "http://private-b8cf44-androidcleancode.apiary-mock.com/v1/city";


  @override
  Future<List<HomeDataSet>> fetchHomeData() async {

    http.Response response = await http.get(url);
    final statusCode = response.statusCode;
    final Map responseBody = json.decode(response.body);
    final DataHomes _dataHotels = new DataHomes.fromMap(responseBody);

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return _dataHotels.data.map((home) => new HomeDataSet.fromMap(home)).toList();

  }

  @override
  Future<List<HomeDataSet>> fetchRecallHomeData() async {

    http.Response response = await http.get(url);
    final statusCode = response.statusCode;
    final Map responseBody = json.decode(response.body);
    final DataHomes _dataHotels = new DataHomes.fromMap(responseBody);

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return _dataHotels.data.map((home) => new HomeDataSet.fromMap(home)).toList();
  }

}