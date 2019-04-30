import 'dart:async';

import 'package:flutter_app_mvp/model/home_data.dart';


abstract class AppRepository {

  Future<List<HomeDataSet>> fetchHomeData();

  Future<List<HomeDataSet>> fetchRecallHomeData();


}
