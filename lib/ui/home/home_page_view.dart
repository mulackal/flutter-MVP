import 'package:flutter_app_mvp/base/base_view.dart';
import 'package:flutter_app_mvp/model/home_data.dart';


abstract class HomePageView implements BaseView{
  onLoadSucces(List<HomeDataSet> items);
}